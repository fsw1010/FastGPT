#!/bin/bash

echo "=== FastGPT 自动化部署脚本 ==="

# 检查 Ollama 是否安装
if ! command -v ollama &> /dev/null; then
    echo "❌ Ollama 未安装，请先安装 Ollama"
    exit 1
fi

# 检查 Docker 是否安装
if ! command -v docker &> /dev/null; then
    echo "❌ Docker 未安装，请先安装 Docker"
    exit 1
fi

echo "✅ 环境检查通过"

# 下载模型
echo "📥 下载 Ollama 模型..."
ollama pull qwen2.5:7b
ollama pull bge-m3:latest

# 启动 Xinference Rerank 模型
echo "🚀 启动 Xinference..."
docker-compose -f docker-compose-simple.yml up -d xinference

# 等待 Xinference 启动
echo "⏳ 等待 Xinference 启动..."
sleep 10

# 启动 Rerank 模型
echo "🎯 启动 Rerank 模型..."
docker exec xinference xinference launch --model-name bge-reranker-v2-m3 --model-type rerank

# 启动 FastGPT
echo "🎉 启动 FastGPT..."
docker-compose -f docker-compose-simple.yml up -d fastgpt

echo "✅ 部署完成！"
echo "🌐 访问地址：http://localhost:3000"
echo "🔐 登录信息：root / kevin"
