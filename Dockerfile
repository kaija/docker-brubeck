FROM alpine:3.10

RUN apk --update upgrade \
    && apk add autoconf automake make gcc g++ libtool \
    && update-ca-certificates
