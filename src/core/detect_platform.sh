platform_family() {
  echo $BARISTA_PLATFORM_FAMILY
}

[[ -z $BARISTA_PLATFORM_FAMILY ]]  || return

if test -f '/etc/arch-release'; then
  BARISTA_PLATFORM_FAMILY='arch'
elif test -f '/etc/redhat-release'; then
  version=$(cat /etc/redhat-release | sed -e 's/.*release //' | cut -d'.' -f1)
  if [[ ${version} -ge 7 ]]; then
    BARISTA_PLATFORM_FAMILY='redhat7'
  else
    BARISTA_PLATFORM_FAMILY='redhat5'
  fi
fi
