BARISTA_PLATFORM_FAMILY=redhat7
source $(dirname $0)/../src/barista.sh

testcase_service_is_started_by_systemd_on_redhat7() {
  assert_match 'systemctl' "$(service_start sshd)"
}

testcase_service_is_enabled_by_systemd_on_redhat7() {
  assert_match 'systemctl' "$(service_enable sshd)"
}
