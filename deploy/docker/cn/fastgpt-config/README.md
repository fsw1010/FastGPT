# FastGPT 配置文件

## 说明
这是一个完整的 FastGPT 配置，包含：
- qwen2.5:7b 聊天模型（Ollama）
- bge-m3:latest 向量模型（Ollama）
- bge-reranker-v2-m3 重排序模型（Xinference）

## 使用方法

### 1. 前置条件
- 安装 Docker 和 Docker Compose
- 安装 Ollama 并下载模型：
  ```bash
  ollama pull qwen2.5:7b
  ollama pull bge-m3:latest
  ```
- 确保有 NVIDIA GPU（用于 Xinference）

### 2. 部署
```bash
# 克隆配置
git clone <your-repo>
cd fastgpt-config

# 启动服务
docker-compose -f docker-compose.pg.yml up -d
```

### 3. 访问
- FastGPT: http://localhost:3000
- 用户名: root
- 密码: kevin

## 配置说明

### 模型配置
- 聊天模型: qwen2.5:7b (Ollama直连)
- 向量模型: bge-m3:latest (Ollama直连)
- Rerank模型: bge-reranker-v2-m3 (Xinference)

### 端口分配
- 3000: FastGPT
- 3001: Aiproxy
- 9997: Xinference
- 9000-9001: MinIO

### 服务架构
```
FastGPT → Ollama (聊天+向量)
FastGPT → Xinference (Rerank)
```

## 注意事项
- 确保 Ollama 服务在宿主机运行
- 确保 Xinference 能访问 GPU
- 首次启动需要等待数据库初始化
