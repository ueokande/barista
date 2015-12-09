BARISTA_PLATFORM_FAMILY=redhat5
source $(dirname $BASH_SOURCE)/../../test_helper.sh

testcase_service_is_started_by_service_on_redhat5() {
  subject service_start sshd
  assert_match 'service' "$stdout"
}

testcase_service_is_enabled_by_chkconfig_on_redhat5() {
  subject service_enable sshd
  assert_match 'chkconfig' "$stdout"
}
