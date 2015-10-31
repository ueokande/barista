package_is_installed() {
  local cmd="rpm -q $1"
  if ! [ -z ${2+x} ]; then
    cmd="$cmd | grep -w -- $1-$2"
  fi
  echo $cmd
}

package_install() {
  if [ -z ${2+x} ]; then
    echo "yum -y install $1"
  else
    echo "yum -y install $1-$2"
  fi
}

package_remove() {
  echo "yum -y remove $1"
}
