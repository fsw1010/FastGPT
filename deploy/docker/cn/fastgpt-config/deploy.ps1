# FastGPT 自动化部署脚本 (Windows)

Write-Host "=== FastGPT 自动化部署脚本 ===" -ForegroundColor Green

# 检查 Ollama
try {
    ollama --version | Out-Null
    Write-Host "✅ Ollama 已安装" -ForegroundColor Green
} catch {
    Write-Host "❌ Ollama 未安装，请先安装 Ollama" -ForegroundColor Red
    exit 1
}

# 检查 Docker
try {
    docker --version | Out-Null
    Write-Host "✅ Docker 已安装" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker 未安装，请先安装 Docker" -ForegroundColor Red
    exit 1
}

# 下载模型
Write-Host "📥 下载 Ollama 模型..." -ForegroundColor Yellow
ollama pull qwen2.5:7b
ollama pull bge-m3:latest

# 启动服务
Write-Host "🚀 启动 FastGPT 服务..." -ForegroundColor Yellow
docker-compose -f docker-compose-simple.yml up -d

Write-Host "✅ 部署完成！" -ForegroundColor Green
Write-Host "🌐 访问地址：http://localhost:3000" -ForegroundColor Cyan
Write-Host "🔐 登录信息：root / kevin" -ForegroundColor Cyan
