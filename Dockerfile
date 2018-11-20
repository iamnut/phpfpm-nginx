FROM alpine:3.8
ENV TZ="Asia/Bangkok"

RUN apk add --no-cache \
      bash \
      curl \
      php5 \
      php5-cli \
      php5-fpm \
      php5-json \
      php5-mcrypt \
      composer \
      tzdata \
      nginx

ADD . /
EXPOSE 80 443
CMD ["/wrapper/entrypoint.sh"]
