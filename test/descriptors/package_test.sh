BARISTA_PLATFORM_FAMILY=redhat7
source $(dirname $0)/../src/barista

testcase_package_command_includes_package_name() {
  assert_match 'nginx' "$(package nginx)"
}

testcase_package_command_includes_remove() {
  assert_match 'remove' "$(package nginx $(action remove))"
}

testcase_package_command_includes_installes_as_default() {
  assert_match 'install' "$(package nginx)"
}

testcase_package_command_use_specified_package() {
  assert_match 'nginx' "$(package webserver $(name nginx))"
}
