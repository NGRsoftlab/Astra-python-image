#!/usr/bin/env sh

set -e

## Check passed arg
: "${1:?}"

find "${1}" -depth \
  \( \
  \( -type d -a \( -name test -o -name tests -o -name idle_test \) \) \
  -o \( -type f -a \( -name '*.pyc' -o -name '*.pyo' -o -name 'libpython*.a' \) \) \
  -o \( -type f -a \( -name '*.ps1' -o -name '*.csh' -o -name '*.fish' \) \) \
  \) -exec rm -rf '{}' \;

find "${1}/" -mindepth 1 -maxdepth 1 -printf '%P\0' \
  | sed -zEn \
    -e '/^pip(|-.+\.dist-info)$/p' \
  | env -C "${1}" xargs -0r \
    rm -rf

exit 0
