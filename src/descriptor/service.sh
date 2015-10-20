# Control the service as following:
#
# service 'sshd' $(
#   action enable start
# )
#
# The descriptor enables and starts sshd service.

service() {
  target="$1"
  shift
  declare -A params='('"$@"')'

  actions=${params[action]}

  [[ -z ${params[name]} ]] || target=${params[name]}
  [[ -z $actions ]] && fatal "Parameter \`action\' is required"

  for action in ${actions}; do
    case $action in
    enable) service_enable $target;;
    disable) service_disable $target;;
    start) service_start $target;;
    stop) service_stop $target;;
    reload) service_stop $target;;
    restart) service_stop $target;;
    esac
  done
}
declare_resources action name
