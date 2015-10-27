BARISTA_PLATFORM_FAMILY=redhat7
source $(dirname $0)/../src/barista.sh

testcase_service_is_started_by_systemd_on_redhat7() {
  subject service_start sshd
  assert_match 'systemctl' "$stdout"
}

testcase_service_is_enabled_by_systemd_on_redhat7() {
  subject service_enable sshd
  assert_match 'systemctl' "$stdout"
}
