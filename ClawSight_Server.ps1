# ClawSight_Server.ps1 - Zero-Config Discovery Engine
# Orchestrator Auto-Generated v1.0

$PORT = 18798
$HOST_URL = "http://localhost:$PORT/"
$SESSIONS_DIR = "$HOME\.openclaw\agents\main\sessions"
$HTML_FILE = "C:\Users\liuji\Desktop\Projects\ClawSight\ClawSight.html"

# 1. 自动定位最新的日志文件
Write-Host "[ClawSight] Scanning for latest session log..." -ForegroundColor Cyan
$latestLog = Get-ChildItem -Path $SESSIONS_DIR -Filter "*.jsonl" | Sort-Object LastWriteTime -Descending | Select-Object -First 1

if (-not $latestLog) {
    Write-Error "No OpenClaw session logs found in $SESSIONS_DIR"
    exit
}

Write-Host "[ClawSight] Monitoring: $($latestLog.FullName)" -ForegroundColor Green

# 2. 启动本地 HTTP 服务
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($HOST_URL)
$listener.Start()

Write-Host "[ClawSight] Server active at $HOST_URL" -ForegroundColor Yellow
Write-Host "[ClawSight] Press Ctrl+C to stop."

# 自动打开浏览器
Start-Process "http://localhost:$PORT"

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        if ($request.Url.AbsolutePath -eq "/") {
            $content = [System.IO.File]::ReadAllBytes($HTML_FILE)
            $response.ContentType = "text/html"
        }
        elseif ($request.Url.AbsolutePath -eq "/logs") {
            # 实时读取日志末尾，模拟流式传输
            $logContent = Get-Content $latestLog.FullName -Raw
            $content = [System.Text.Encoding]::UTF8.GetBytes($logContent)
            $response.ContentType = "application/json"
            $response.AddHeader("Access-Control-Allow-Origin", "*")
        }
        else {
            $response.StatusCode = 404
            $content = [System.Text.Encoding]::UTF8.GetBytes("Not Found")
        }

        $response.ContentLength64 = $content.Length
        $response.OutputStream.Write($content, 0, $content.Length)
        $response.Close()
    }
}
finally {
    $listener.Stop()
}
