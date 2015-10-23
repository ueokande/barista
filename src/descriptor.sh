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

require 'descriptor/service.sh'
require 'descriptor/package.sh'
