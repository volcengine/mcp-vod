#!/bin/bash
set -e

# 清理之前的构建
echo "清理之前的构建文件..."
rm -rf dist/ build/ *.egg-info

# 安装构建依赖
echo "安装构建依赖..."
# 使用当前激活的 Python 环境
uv pip install build twine

# 构建包
echo "构建 vod-mcp 包..."
uv run  -m build

echo "构建完成！生成的文件在 dist/ 目录下"

# 本地测试安装
echo "测试本地安装..."
uv pip install -e .

# 测试 uvx 命令
echo "测试 uvx 命令..."
uvx --from . vod