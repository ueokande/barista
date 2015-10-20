# Control the service as
#
# service 'sshd' $(
#   action 'ename'
# )
#
# is enable sshd service
service() {
  target="$1"
  shift
  declare -A params='('"$@"')'

  [[ -z ${params[name]} ]] || target=${params[name]}
  [[ -z ${params[action]} ]] && fatal "Parameter \`action\' is required"

  echo service[$target] with ${params[action]}
}
declare_resources action name
