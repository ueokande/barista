# Manage a package as following:
#
# package 'nginx'
#
# The descriptor installs package 'nginx'

package() {
  target="$1"
  shift
  declare -A params='('"$@"')'

  [[ -z ${params[name]} ]] || target=${params[name]}
  action=${params[action]-install}
  case $action in
    install)
      echo "$(package_is_installed $target ${params[version]}) || $(package_install $target ${params[version]})";;
    remove)
      echo "$(package_is_installed $target ${params[version]}) || $(package_remove $target ${params[version]})" ;;
  esac
}
declare_resources action name version
