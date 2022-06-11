# 选择更小体积的基础镜像
FROM nginx:1.20-alpine
ADD nginx.conf /etc/nginx/conf.d/default.conf
# COPY www /usr/share/nginx/html
ADD www /usr/share/nginx/html
