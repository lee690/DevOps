FROM alpine
LABEL maintainer="Christopher Jean <dev.cl.jean@gmail.com>" 

RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_amd64.zip && \
    unzip /tmp/terraform.zip -d /

RUN apk add --no-cache ca-certificates curl

USER nobody
ENTRYPOINT ["/terraform"]

