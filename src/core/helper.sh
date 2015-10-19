defined() {
  hash $1 2>/dev/null
}

fatal() {
  >&2 echo $@
  exit 1
}
