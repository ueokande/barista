BARISTA_PLATFORM_FAMILY=redhat5
source $(dirname $0)/../src/barista.sh

testcase_service_is_started_by_service_on_redhat5() {
  service sshd $(action start)
  assert_match 'service' "$(run_commands)"
}

testcase_service_is_enabled_by_chkconfig_on_redhat5() {
  service sshd $(action enable)
  assert_match 'chkconfig' "$(run_commands)"
}
