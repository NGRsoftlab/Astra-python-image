#!/usr/bin/env sh

set -ex

## Check command on exist
__is_command() {
  command -v "${1}" >/dev/null
}

: "${1:?Pass python package_site path}"

## Ensure binary is exists
ERROR_COUNT=0
for i in truncate xargs find strip sed; do
  if ! __is_command "${i}"; then
    stderr "[ERROR]: '${i}' does not exits"
    ERROR_COUNT=$((ERROR_COUNT + 1))
  fi
done
[ "${ERROR_COUNT}" -eq 0 ] || exit 127
unset ERROR_COUNT

## Remove list MAC-prefix IEEE, IAB and index file for fast search
## Warning if app use `netaddr.EUI()` applying this u can broke ur app
truncate -s 0 \
  "${1}/netaddr/eui/iab.idx" \
  "${1}/netaddr/eui/iab.txt" \
  "${1}/netaddr/eui/oui.txt" \
  "${1}/netaddr/eui/oui.idx"

## Strip debug info from shared object, but expect *rust*.so library(Important because strip debug from *rust* may broke app)
## Also include numpy to lib exclude to prevent error:
## numpy: Error importing numpy: you should not try to import numpy from
##        its source directory; please exit the numpy source tree, and relaunch
##        your python interpreter from there.
find "${1}/" -type f -name '*.so*' -exec ls -l {} \;
echo

find "${1}/" -type f -name '*.so*' -printf '%p\0' \
  | sed -zE '/rust/d' -zE '/numpy/d' \
  | xargs -0r strip --verbose --strip-debug --strip-unneeded

echo
find "${1}/" -type f -name '*.so*' -exec ls -l {} \;

## Avoid changing already present packages and exclude duplicates
find "${1}/" -mindepth 1 -maxdepth 1 -printf '%P\0' \
  | sed -zEn \
    -e '/^pip(|-.+\.dist-info)$/p' \
  | env -C "${1}" xargs -0r \
    rm -rf
