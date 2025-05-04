#!/usr/bin/env sh

set -e

for src in idle3 pip3 python3 python3-config; do
  dst="$(echo "${src}" | tr -d 3)"
  if [ -s "/usr/bin/${src}" ] && [ ! -e "/usr/local/bin/${dst}" ]; then
    ln -svT "/usr/bin/${src}" "/usr/local/bin/${dst}"
  fi
done

exit 0
