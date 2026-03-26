# ClawSight - 零 Token 桌面遥测监控 (Zero-Token Dashboard)

[English Version Below]

## 🌟 项目简介
ClawSight 是一款专门为 OpenClaw 开发的极简、跨平台、零 Token 消耗的桌面监控工具。它通过直接监听本地文件系统，实时可视化展示 Agent 的工作状态，不产生任何额外的 API 消耗。

## 🚀 核心特性
- **极致节流**：通过浏览器直接轮询本地 JSONL 日志，无需经过 LLM，Token 消耗为零。
- **零配置启动**：自动扫描 OpenClaw 默认路径，安装即用。
- **模块化显示**：可自由勾选/隐藏思考日志、任务流图、资源监控。
- **全平台支持**：基于 HTML5 + Webview，支持 Windows/macOS/Linux。

## 🛠️ 快速开始
1. 克隆仓库。
2. 双击打开 `ClawSight.html`。
3. 工具会自动检测本地 OpenClaw 实例。

---

# ClawSight - Zero-Token Desktop Telemetry Dashboard

## 🌟 Overview
ClawSight is a minimalist, cross-platform telemetry dashboard for OpenClaw. It monitors your AI agents by reading local logs directly, ensuring zero additional token usage.

## 🚀 Features
- **Zero-Token Overhead**: No LLM calls needed for UI updates.
- **Zero Configuration**: Automatically scans for OpenClaw local instances.
- **Modular Dashboard**: Toggle thought logs, task pipelines, and metrics on the fly.
- **Cross-Platform**: Runs in any modern webview or browser.

## 🛠️ Quick Start
1. Clone the repository.
2. Open `ClawSight.html` in your browser or webview.
3. The dashboard will auto-detect your local OpenClaw workspace.
