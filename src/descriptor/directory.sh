directory() {
  target="$1"
  shift
  declare -A params='('"$@"')'

  run "$(directory_exists $target) || $(directory_create $target)"
  [ $# -eq 0 ] && return 0
  [ -n ${params[mode]+x} ] && run $(directory_change_mode ${target} ${params[mode]})
  [ -n ${params[owner]+x} ] && run $(directory_change_owner ${target} ${params[owner]})
  [ -n ${params[group]+x} ] && run $(directory_change_group ${target} ${params[group]})
}
declare_resources mode owner group
