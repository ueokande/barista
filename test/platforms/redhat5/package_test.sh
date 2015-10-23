BARISTA_PLATFORM_FAMILY=redhat5
source $(dirname $0)/../src/barista

assert_true \
  'Package is managed by yum' \
  'package nginx | grep yum'
