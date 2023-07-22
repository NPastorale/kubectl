FROM alpine AS builder

ARG TARGETARCH

RUN apk update && \
    apk add --no-cache curl

RUN curl -Lo /kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${TARGETARCH}/kubectl"

RUN chmod +x /kubectl

FROM scratch
COPY --from=builder /kubectl /kubectl

ENTRYPOINT [ "/kubectl" ]