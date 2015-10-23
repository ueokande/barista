package_is_installed() {
  if [ -z $2 ]; then
    echo "pacman -Q $1"
  else
    ( echo $2 | grep '-' >/dev/null ) && ptn="^$2$" || ptn="^$2-"
    echo "pacman -Q $1 | awk '{print \$2}' | grep '$ptn'"
  fi
}

package_install() {
  echo "pacman -S --noconfirm $1"
}

package_remove() {
  echo "pacman -R --noconfirm $1"
}
