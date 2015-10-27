BARISTA_PLATFORM_FAMILY=redhat7
source $(dirname $0)/../src/barista.sh

testcase_service_is_started_by_systemd_on_redhat7() {
  service sshd $(action start)
  assert_match 'systemctl' "$(run_commands)"
}

testcase_service_is_enabled_by_systemd_on_redhat7() {
  service sshd $(action enable)
  assert_match 'systemctl' "$(run_commands)"
}
