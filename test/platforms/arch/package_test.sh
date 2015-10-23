BARISTA_PLATFORM_FAMILY=arch
source $(dirname $0)/../src/barista

assert_true \
  'Package is managed by pacman' \
  'package nginx | grep pacman'
