FROM nginx:alpine
MAINTAINER Christopher Jean <dev.cl.jean@gmail.com>

COPY website /website
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
