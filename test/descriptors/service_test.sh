BARISTA_PLATFORM_FAMILY=redhat7
source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_service_returns_false_if_action_is_not_specified() {
  assert_false service sshd
}

testcase_service_issue_2_commands_when_2_commands_specified() {
  service sshd $(action start enable)
  assert_equal 2 $(run_commands | wc -l)
}
