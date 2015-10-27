BARISTA_PLATFORM_FAMILY=arch
source $(dirname $0)/../src/barista.sh

testcase_packagees_are_managed_by_pacma_on_arch() {
  assert_match 'pacman' "$(package nginx)"
}
