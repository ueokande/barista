BARISTA_PLATFORM_FAMILY=redhat5
source $(dirname $BASH_SOURCE)/../../test_helper.sh

testcase_packages_are_managed_by_yum_on_redhat5() {
  subject package_install nginx
  assert_match 'yum' "$stdout"
}
