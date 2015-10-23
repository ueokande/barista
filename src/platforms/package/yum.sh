package_is_installed() {
  cmd="rpm -q $1"
  if ! [ -z $2 ]; then
    cmd="$cmd | grep -w -- $1-$2"
  fi
  echo $cmd
}

package_install() {
  if [ -z $2 ]; then
    echo "yum -y install $1"
  else
    echo "yum -y install $1-$2"
  fi
}

package_remove() {
  echo "yum -y remove $1"
}
