# Codex Proxy Launcher

一个适用于 Windows 的 Codex Desktop 代理启动脚本。

脚本会为本次启动临时设置代理环境变量，自动查找 Microsoft Store 安装的 Codex Desktop，然后启动应用。它不会修改 Windows 的系统代理，也不会改动 Codex 的配置文件。

## 适用场景

- 已通过 Microsoft Store 安装 Codex Desktop。
- 本机代理软件已经运行，并提供 HTTP 代理端口。
- 希望只让本次启动的 Codex 使用指定代理，不影响其他应用。

## 默认配置

脚本默认连接：

```text
http://127.0.0.1:7897
```

如果你的代理端口不是 `7897`，请用文本编辑器打开 `codex-proxy.cmd`，修改下面两行：

```bat
set "HTTP_PROXY=http://127.0.0.1:7897"
set "HTTPS_PROXY=http://127.0.0.1:7897"
```

例如，本机代理端口为 `7890`：

```bat
set "HTTP_PROXY=http://127.0.0.1:7890"
set "HTTPS_PROXY=http://127.0.0.1:7890"
```

## 使用方法

1. 下载本项目中的 [`codex-proxy.cmd`](./codex-proxy.cmd)。
2. 确认本机代理软件已经启动，并检查代理端口。
3. 根据需要修改脚本中的 `HTTP_PROXY` 和 `HTTPS_PROXY`。
4. 双击 `codex-proxy.cmd` 启动 Codex Desktop。

也可以在命令提示符中运行：

```bat
codex-proxy.cmd
```

## 工作原理

脚本会执行以下操作：

1. 仅在当前脚本进程中设置 `HTTP_PROXY` 和 `HTTPS_PROXY`。
2. 将 `localhost`、`127.0.0.1` 和 `::1` 加入 `NO_PROXY`。
3. 自动查询最新安装的 `OpenAI.Codex` Microsoft Store 软件包。
4. 定位 Codex Desktop 的可执行文件并启动应用。
5. 如果没有找到安装包或程序文件，显示错误提示并停止。

关闭通过此脚本启动的 Codex 后，临时代理环境不会继续影响系统中的其他程序。

## 常见问题

### 提示找不到 Codex

请确认已经从 Microsoft Store 安装或更新 Codex Desktop。脚本查找的软件包名称是 `OpenAI.Codex`。

### Codex 启动后仍然无法连接

请依次检查：

- 代理软件是否正在运行。
- HTTP 代理端口是否确实为 `7897`。
- 代理软件是否允许本机程序连接该端口。
- 是否完全退出了之前启动的 Codex，再通过脚本重新打开。
- 当前代理节点是否能够正常访问所需服务。

### 会修改系统代理或 SSH 配置吗？

不会。本脚本只为当前启动进程设置代理环境变量，不修改 Windows 系统代理、Git 配置、SSH 配置或 Codex 配置文件。

## 安全说明

- 不要把 API Key、账号密码、Cookie 或其他凭据写入脚本。
- 不要提交 `.env`、密钥、数据库或本机配置文件到公开仓库。
- 请使用自己信任的代理服务，并自行确认当地法律法规与服务条款。
- 本项目是社区实用脚本，与 OpenAI 官方无隶属或合作关系。

## 关于 Redman

本项目由 **红孩儿 Redman** 分享。频道关注 AI、Codex / AI Agent 实战、数字工具、网络技术和内容创业，希望把真实使用过程中的方法与踩坑经验整理成可以直接复现的教程。

- [订阅红孩儿 Redman 的 YouTube 频道](https://www.youtube.com/channel/UCOw7Ks3TeXBXd4TPb-K9lTg?sub_confirmation=1)
- [Codex3721：中文 Codex / AI Agent 实战指南](https://codex3721.com/)
- [Redman3721 工具导航](https://www.redman3721.com/)
- [Redman 博客](https://redman.blog/)
- [X / Twitter：@redman_talk](https://x.com/redman_talk)
- [Telegram：Redman3721 交流群](https://t.me/redman3721)

如果这个脚本对你有帮助，欢迎给项目点一个 Star，并订阅 YouTube 频道获取后续实战教程。

## 免责声明

本项目仅用于技术学习与个人效率提升。Codex、OpenAI 以及其他名称和商标归其各自权利人所有。软件功能、安装路径和网络要求可能随版本更新而变化，请以对应产品的官方说明为准。
