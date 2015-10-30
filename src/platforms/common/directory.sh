directory_exists() {
  echo "test -d $1"
}

directory_create() {
  echo "mkdir -p $1"
}

directory_change_mode() {
  echo "chmod $2 $1"
}

directory_change_owner() {
  echo "chown $2 $1"
}

directory_change_group() {
  echo "chgrp $2 $1"
}
