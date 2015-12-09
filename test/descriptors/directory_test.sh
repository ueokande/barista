BARISTA_PLATFORM_FAMILY=arch
source $(dirname $BASH_SOURCE)/../test_helper.sh

setup() {
  TMPDIR=$(mktemp -d)
}

teardown() {
  rm -rf "$TMPDIR"
}

testcase_description_create_by_mkdir() {
  directory "$TMPDIR/dir1"
  assert_match 'mkdir' "$(run_commands)"
  assert_match "$TMPDIR/dir1" "$(run_commands)"
}

testcase_directory_changes_attributes() {
  directory "$TMPDIR/dir2" $(
    mode '777'
    owner 'bob'
    group 'users'
  )
  assert_match '777' "$(run_commands)"
  assert_match 'bob' "$(run_commands)"
  assert_match 'users' "$(run_commands)"
}
