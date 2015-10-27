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
  info "    package : $target $version"
  info "        action : $action"
  case $action in
    install)
      run "( $(package_is_installed $target $version) 2>/dev/null) || $(package_install $target $version)";;
    remove)
      run "( $(package_is_installed $target $version) 2>/dev/null) || $(package_remove $target $version)";;
  esac
}
declare_resources action name version
