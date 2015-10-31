# Control the service as following:
#
# service 'sshd' $(
#   action enable start
# )
#
# The descriptor enables and starts sshd service.

service() {
  parse_params

  target=${name-$target}
  [ -z ${action+x} ] && fatal "Parameter \`action\' is required"

  local action
  for action in ${params[action]}; do
    case $action in
    enable) run $(service_enable $target);;
    disable) run $(service_disable $target);;
    start) run $(service_start $target);;
    stop) run $(service_stop $target);;
    reload) run $(service_stop $target);;
    restart) run $(service_stop $target);;
    esac
  done
}
declare_resources action name
