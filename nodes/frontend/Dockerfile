FROM node:18

# 1. serve 설치만
RUN npm install -g serve

# 2. 빌드된 React 정적 파일 복사
WORKDIR /app
COPY . ./appdir

# 3. 인증서 + nginx 설치 + 용량 최적화
RUN apt-get update && apt-get install -y nginx openssl && rm -rf /var/lib/apt/lists/*

# 5. self-signed SSL 인증서 생성
RUN mkdir -p /etc/ssl/certs /etc/ssl/private && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/CN=localhost"

# 6. Nginx 설정 추가
RUN echo 'server {\n\
    listen 443 ssl;\n\
    server_name localhost;\n\
    \n\
    ssl_certificate /etc/ssl/certs/nginx.crt;\n\
    ssl_certificate_key /etc/ssl/private/nginx.key;\n\
    \n\
    location / {\n\
    proxy_pass http://localhost:3000;\n\
    proxy_set_header Host $host;\n\
    proxy_set_header X-Real-IP $remote_addr;\n\
    }\n\
    }' > /etc/nginx/sites-available/default

# 7. 포트 노출 및 CMD (serve + nginx)
EXPOSE 443
CMD sh -c "serve -s /app/appdir & nginx -g 'daemon off;'"