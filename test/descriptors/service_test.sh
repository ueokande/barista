BARISTA_PLATFORM_FAMILY=redhat7
source $(dirname $0)/../src/barista.sh

testcase_service_returns_false_if_action_is_not_specified() {
  assert_false service sshd
}

testcase_service_issue_2_commands_when_2_commands_specified() {
  assert_equal 2 $(service sshd $(action start enable) | wc -l)
}
