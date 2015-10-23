# Manage a package as following:
#
# package 'nginx'
#
# The descriptor installs package 'nginx'

package() {
  target="$1"
  shift
  declare -A params='('"$@"')'

  target=${params[name]-$target}
  action=${params[action]-install}
  version=${params[version]-}
  case $action in
    install)
      echo "$(package_is_installed $target $version) || $(package_install $target $version)";;
    remove)
      echo "$(package_is_installed $target $version) || $(package_remove $target $version)";;
  esac
}
declare_resources action name version
