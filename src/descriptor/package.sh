# Manage a package as following:
#
# package 'nginx'
#
# The descriptor installs package 'nginx'

package() {
  parse_params

  local target=${name-$target}
  local action=${action-install}
  local version=${version-}

  case $action in
  install)
    run "$(package_is_installed $target $version) || $(package_install $target $version)";;
  remove)
    run "$(package_is_installed $target $version) || $(package_remove $target $version)";;
  esac
}
declare_resources action name version
