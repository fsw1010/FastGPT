#!/bin/bash

# 设置变量
IMAGE_NAME="fastgpt-ollama-xinference"
VERSION="v1.0"
DOCKER_HUB_USERNAME="your-dockerhub-username"

# 构建镜像
echo "构建 Docker 镜像..."
docker build -t ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${VERSION} .
docker build -t ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:latest .

# 推送到 Docker Hub
echo "推送到 Docker Hub..."
docker push ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${VERSION}
docker push ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:latest

echo "完成！"
echo "拉取命令：docker pull ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${VERSION}"
