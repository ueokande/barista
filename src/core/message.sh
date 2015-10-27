debug() {
  [[ -z ${BARISTA_LOG_LEVEL+x} ]] && return
  [[ $BARISTA_LOG_LEVEL =~ ^(debug|info)$ ]] || return
  echo "$@" >&2
}

info() {
  [[ -z ${BARISTA_LOG_LEVEL+x} ]] && return
  [[ $BARISTA_LOG_LEVEL =~ ^(info)$ ]] || return
  echo "$@" >&2
}

fatal() {
  echo "$@" >&2
  exit 1
}
