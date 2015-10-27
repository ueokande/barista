shopt -s expand_aliases

alias require='require_from $(dirname $BASH_SOURCE)'
require_from() {
  source $1/$2
}

require 'core.sh'
require 'descriptor.sh'
require 'platforms.sh'
