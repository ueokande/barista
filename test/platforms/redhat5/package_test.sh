BARISTA_PLATFORM_FAMILY=redhat5
source $(dirname $0)/../src/barista.sh

testcase_packages_are_managed_by_yum_on_redhat5() {
  assert_match 'yum' "$(package nginx)"
}
