#!/usr/bin/env sh
# shellcheck disable=SC2034
set -a

PIP_DISABLE_PIP_VERSION_CHECK=1
PIP_NO_CACHE_DIR=1
PIP_ROOT_USER_ACTION=ignore
PIP_NO_COMPILE=1
# PIP_BREAK_SYSTEM_PACKAGES=1
set +a

NUMBER_TRY=0
MAX_TRY=1
until [ "${NUMBER_TRY}" -gt "${MAX_TRY}" ]; do
  set +e
  (
    exec "$@"
  )
  CODE=$?
  set -e
  if [ "${CODE}" -eq 0 ]; then
    break
  fi
  if [ "${NUMBER_TRY}" -eq "${MAX_TRY}" ]; then
    exit "${CODE}"
  fi
  echo "pip failed, retrying"
  NUMBER_TRY=$((NUMBER_TRY + 1))
  ## Prevent pip error
  ## TypeError: expected str, bytes or os.PathLike object, not int
  PIP_NO_CACHE_DIR=0
done
