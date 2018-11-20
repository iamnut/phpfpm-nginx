#!/usr/bin/env bash
set -e

function sigterm_handler() {
  echo "SIGTERM or SIGINT signal received, try to gracefully shutdown all services..."
  kill `cat /run/*.pid`
}

trap "sigterm_handler; exit" TERM SIGINT

php-fpm5 --allow-to-run-as-root \
         --fpm-config /wrapper/config/php-fpm.conf &

nginx -g "daemon off;" \
      -c /wrapper/config/nginx.conf &

wait
