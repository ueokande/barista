BARISTA_PLATFORM_FAMILY=redhat7
source $(dirname $0)/../src/barista

assert_false \
  "Service returns false if action is not specified" \
  "service sshd"

assert_true \
  "Service issue 2 commands when 2 commands specified" \
  "[[ $(service sshd $(action start enable) | wc -l) -eq 2 ]]"
