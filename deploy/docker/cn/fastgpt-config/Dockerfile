FROM registry.cn-hangzhou.aliyuncs.com/fastgpt/fastgpt:v4.14.4

# 复制配置文件
COPY config.json /app/data/config.json

# 设置环境变量
ENV OPENAI_BASE_URL=http://host.docker.internal:11434/v1
ENV CHAT_API_KEY=ollama

# 暴露端口
EXPOSE 3000

# 启动命令
CMD ["npm", "run", "start"]
