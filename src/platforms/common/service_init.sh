service_is_enabled() {
  echo chkconfig --list "$1" | grep 3:on
}

service_is_running() {
  echo service "$1" status
}

service_enable() {
  echo chkconfig "$1" on
}

service_disable() {
  echo chkconfig "$1" off
}

service_start() {
  echo service "$1" start
}

service_stop() {
  echo service "$1" stop
}

service_restart() {
  echo service "$1" restart
}

service_reload() {
  echo service "$1" reload
}
