BARISTA_PLATFORM_FAMILY=redhat7
source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_package_command_includes_package_name() {
  package nginx
  assert_match 'nginx' "$(run_commands)"
}

testcase_package_command_includes_remove() {
  package nginx $(action remove)
  assert_match 'remove' "$(run_commands)"
}

testcase_package_command_includes_installes_as_default() {
  package nginx
  assert_match 'install' "$(run_commands)"
}

testcase_package_command_use_specified_package() {
  package webserver $(name nginx)
  assert_match 'nginx' "$(run_commands)"
}
