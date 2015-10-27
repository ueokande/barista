BARISTA_PLATFORM_FAMILY=redhat5
source $(dirname $0)/../src/barista.sh

testcase_service_is_started_by_service_on_redhat5() {
  assert_match 'service' "$(service sshd $(action start))"
}

testcase_service_is_enabled_by_chkconfig_on_redhat5() {
  assert_match 'chkconfig' "$(service sshd $(action enable))"
}
