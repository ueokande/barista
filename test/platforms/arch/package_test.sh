BARISTA_PLATFORM_FAMILY=arch
source $(dirname $BASH_SOURCE)/../../test_helper.sh

testcase_packagees_are_managed_by_pacma_on_arch() {
  subject package_install nginx
  assert_match 'pacman' "$stdout"
}
