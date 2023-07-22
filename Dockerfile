FROM alpine

ARG TARGETARCH

RUN apk update && \
    apk add --no-cache \
    bash \
    curl \
    iputils-ping

RUN curl -Lo /kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${TARGETARCH}/kubectl"

RUN chmod +x /kubectl