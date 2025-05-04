#!/usr/bin/env sh

set -e

## Check receiving args
: "${1:?}"

## Where should be copy
TRANSFER_FILE_PATH="${1}"
shift 1

## What should be copy
for l in "$@"; do
  ## Check variable on exists
  : "${l:?}"
  ## Copy with mask NAME-*.so
  find "${l%/*}" -name "${l##*/}-*.so" -exec cp -P "{}" "${TRANSFER_FILE_PATH}" \; || :
  ## Copy with mask NAME.so.*
  find "${l%/*}" -name "${l##*/}.so.*" -exec cp -P "{}" "${TRANSFER_FILE_PATH}" \; || :
done
