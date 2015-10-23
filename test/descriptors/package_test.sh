BARISTA_PLATFORM_FAMILY=redhat7
source $(dirname $0)/../src/barista

assert_true \
  'package command includes package name' \
  'package nginx | grep nginx'

assert_true \
  'package command includes remove' \
  'package nginx $(action remove) | grep remove'

assert_true \
  'package command includes installes as default' \
  'package nginx | grep install'

assert_true \
  'package command use specified package' \
  'package webserver $(name nginx) | grep nginx'
