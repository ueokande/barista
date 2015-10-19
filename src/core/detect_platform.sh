platform_family() {
  echo $PATISSIER_PLATFORM_FAMILY
}

if test -f '/etc/arch-release'; then
  PATISSIER_PLATFORM_FAMILY='arch'
elif test -f '/etc/redhat-release'; then
  version=$(cat /etc/redhat-release | sed -e 's/.*release //' | cut -d'.' -f1)
  if [[ ${version} -ge 7 ]]; then
    PATISSIER_PLATFORM_FAMILY='redhat7'
  else
    PATISSIER_PLATFORM_FAMILY='redhat5'
  fi
fi
