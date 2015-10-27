# declare_resources declares a function named given parameter.
# The function display the formatted resource with the name.
#
# $ declare_resources hoge  # define function `hoge'
# $ hoge '123'              # echo '[hoge]=123'
declare_resources() {
  for r in $@; do
    eval ${r}'() { echo "['${r}']=\"$@\""; }'
  done
}

BARISTA_RUN_COMMANDS=()

run() {
  BARISTA_RUN_COMMANDS+=("$(echo $@)")
}

run_commands(){
  for cmd in "${BARISTA_RUN_COMMANDS[@]}"; do
    echo $cmd
  done
}

require 'descriptor/service.sh'
require 'descriptor/package.sh'
