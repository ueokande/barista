BARISTA_PLATFORM_FAMILY=redhat7
source $(dirname $0)/../src/barista

assert_true \
  "Service is started by systemd on redhat7" \
  "service sshd $(action start) | grep systemctl"

assert_true \
  "Service is enabled by systemd on redhat7" \
  "service sshd $(action enable) | grep systemctl"
