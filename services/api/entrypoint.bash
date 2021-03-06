#!/usr/bin/env bash

set -e

pid="0"

term_handler() {
  echo "[entrypoint] received SIGTERM - stopping!"
  kill -SIGTERM $pid
  wait $pid
  exit 143; # 128 + 15 -- SIGTERM
}

main() {
  local script="$@"

  echo "[entrypoint] running '$script'"
  mix $script &
  pid="$!"
  wait $pid
}

trap term_handler SIGTERM
main "$@"
