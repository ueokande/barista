directory() {
  parse_params

  run "$(directory_exists $target) || $(directory_create $target)"
  [ $# -eq 0 ] && return 0
  [ -z ${mode+x} ] || run $(directory_change_mode $target $mode)
  [ -z ${owner+x} ] || run $(directory_change_owner $target $owner)
  [ -z ${group+x} ] || run $(directory_change_group $target $group)
}
declare_resources mode owner group
