#!/usr/bin/env bash
## GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)
## mawk 1.3.4 20200120

## DESCRIPTION
##   This script analyzes your application using the strace utility and
##   processes 'openat/execve' calls for 10 seconds from the moment your
##   application is launched. It then analyzes the input data and parses
##   it into a full list of libraries, a list of all shared objects,
##   and the paths to these objects.

## EXAMPLE USAGE
##   wrapper-lib.sh <list of command>
##
##   wrapper-lib.sh gunicorn \
##                  --certfile etc/service.crt \
##                  --keyfile etc/service.key \
##                  -b 0.0.0.0:5054 \
##                  'example-python-app:create_app()'

## EXIT CODES
##   exit code 120
##     No passed args
##   exit code 127
##     Utility not found; you must install it because this script depends on it

set -Eeuo pipefail

##
## FUNCTIONS
##

## Check command on exist
__is_command() {
  command -v "${1}" >/dev/null
}

## Extract path to 'openat' files
__extract_so_libs() {
  local FILE_PATH="${1}"

  mawk '
  {
      ## Remove all before first quotes
      start = index($0, "\"")
      if (start == 0)
          next

      ## Trim the string to the first quote
      line = substr($0, start + 1)

      ## Find end of path (second quote)
      end = index(line, "\"")
      if (end == 0)
          next

      ## Get full path
      path = substr(line, 1, end - 1)

      ## Filter only ".so" files
      if (path ~ /\.so/)
          print path
  }' "${FILE_PATH}" | sort -u
}

## Wait screen
__waiting_screen() {
  local MSG TIME_S
  MSG="${1}"
  TIME_S="${2}"

  ## Hide cursor
  tput civis

  for ((i = TIME_S; i >= 1; i--)); do
    echo -ne "${MSG}: ${i} \033[0K\r"
    sleep 1
  done

  ## Normal cursor
  tput cnorm
}

## Stderror output
stderr() {
  echo >&2 "$@"
}

## Check on exists command
ERROR_COUNT=0
for i in mawk strace grep sort sed; do
  __is_command "${i}" || {
    stderr "[ERROR]: '${i}' does not exits"
    ((ERROR_COUNT++)) || true
  }
done
[[ ${ERROR_COUNT} -eq 0 ]] || exit 127
unset ERROR_COUNT

## Check passed args
[[ $# -ne 0 ]] || {
  stderr "[ERROR]: No arguments provided"
  exit 120
}

##
## MAIN SCRIPT
##

## Define base variables
OUTPUT_DIR="./deps"
LOGFILE="${OUTPUT_DIR}/trace.log"

## Create dir if not exists
[[ -d ${OUTPUT_DIR} ]] || mkdir -p "${OUTPUT_DIR}"

## Trace application for openat/execve processes
strace -f -o "${LOGFILE}" -e trace=openat,execve "$@" 2>&1 &

## Save pid for background process
PID=$!

## Wait until program start
__waiting_screen "wait until program start" "10"

## Kill process
kill -9 "${PID}" 2>/dev/null || true

## Get all open files
grep 'openat.*\.so' "${LOGFILE}" \
  | sed -E 's/.*filename="([^"]+)".*/\1/' \
  | sort -u >"${OUTPUT_DIR}/lib.list"

# Additional execve
grep 'execve' "${LOGFILE}" \
  | sed -E 's/.*"([^"]+)".*/\1/' \
  | sort -u >>"${OUTPUT_DIR}/lib.list"

## Filter by path
while read -r line; do
  echo "/${line}"
done < <(grep -v '^/' "${OUTPUT_DIR}/lib.list") >"${OUTPUT_DIR}/full_paths.list"

## Sorted uniq string
sort -u "${OUTPUT_DIR}/full_paths.list" -o "${OUTPUT_DIR}/full_paths.list"

## Filter only path
__extract_so_libs "${OUTPUT_DIR}/full_paths.list" | sort -u | grep -v 'lib-dynload\|site-packages' >"${OUTPUT_DIR}/filter_paths.list"

exit 0
