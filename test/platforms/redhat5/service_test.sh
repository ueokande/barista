PATISSIER_PLATFORM_FAMILY=redhat5
source $(dirname $0)/../src/patissier

assert_true \
  "Service is started by 'service' on redhat5" \
  "service sshd $(action start) | grep service"

assert_true \
  "Service is enabled by 'chkconfig' on redhat5" \
  "service sshd $(action enable) | grep chkconfig"
