FROM alpine:edge as builder

RUN apk --update upgrade \
    && apk add autoconf automake make gcc g++ libtool

RUN apk add jansson-dev git libmicrohttpd-dev openssl-dev

COPY brubeck /brubeck

WORKDIR /brubeck

RUN make

FROM alpine:edge

RUN apk --update upgrade \
	&& apk add jansson libmicrohttpd openssl

RUN mkdir -p /etc/brubeck

COPY --from=builder /brubeck/brubeck /bin/brubeck

COPY config.json /etc/brubeck/config.json

EXPOSE 8125 9125

CMD ["brubeck", "--config", "/etc/brubeck/config.json"]
