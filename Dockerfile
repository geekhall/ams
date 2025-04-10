# 构建镜像
# docker build -t ams-app .
# 运行容器
# docker run -p 80:80 -p 8888:8888 ams-app
# 构建前端
FROM node:18 AS frontend-build
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ ./
RUN npm run build

# 构建后端
FROM maven:3.9.4-eclipse-temurin-17 AS backend-build
WORKDIR /app/backend
COPY backend/pom.xml ./
RUN mvn dependency:go-offline
COPY backend/ ./
RUN mvn package -DskipTests

# 运行阶段
FROM eclipse-temurin:17-jre AS backend
WORKDIR /app
# 复制后端构建产物
COPY --from=backend-build /app/backend/target/*.jar ./app.jar

# 使用 Nginx 托管前端
FROM nginx:1.25 AS production
WORKDIR /usr/share/nginx/html
# 清空默认的 Nginx 静态文件
RUN rm -rf ./*
# 复制前端构建产物
COPY --from=frontend-build /app/frontend/dist/ ./
# 复制自定义 Nginx 配置文件
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露端口
EXPOSE 80 8888

# 启动后端和 Nginx
CMD ["sh", "-c", "nginx -g 'daemon off;' & java -jar /app/app.jar"]

