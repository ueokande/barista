source $(dirname $BASH_SOURCE)/../../test_helper.sh

before_each() {
  TMPDIR=$(mktemp -d)
}

after_each() {
  rm -rf "$TMPDIR"
}

testcase_directory_exists() {
  eval $(mkdir -p $TMPDIR/new_directory)
  assert_true eval $(directory_exists $TMPDIR/new_directory)
  assert_false eval $(directory_exists $TMPDIR/ghost_directory)
}

testcase_creates_directory() {
  eval $(directory_create $TMPDIR/maked_directory)
  assert_true test -d $TMPDIR/maked_directory
}

testcase_change_directory_mode() {
  eval $(directory_create $TMPDIR/my_mode_directory)
  eval $(directory_change_mode $TMPDIR/my_mode_directory 707)

  subject stat -c "%a" $TMPDIR/my_mode_directory
  assert_equal 707 $stdout
}
