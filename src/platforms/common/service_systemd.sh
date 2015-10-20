service_is_enabled() {
  echo systemctl --quiet is-enabled "$1"
}

service_is_running() {
  echo systemctl --quiet is-active "$1"
}

service_enable() {
  echo systemctl enable "$1"
}

service_disable() {
  echo systemctl disable "$1"
}

service_start() {
  echo systemctl start "$1"
}

service_stop() {
  echo systemctl stop "$1"
}

service_restart() {
  echo systemctl restart "$1"
}

service_reload() {
  echo systemctl reload "$1"
}
