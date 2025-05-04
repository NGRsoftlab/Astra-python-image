#!/usr/bin/env sh
## GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)

## DESCRIPTION
##   This script is meant for copying binaries into distroless Docker images.
##   It will copy binaries, shared object linked libraries the binary depends
##   on, and it can additionally copy all symlinks pointing to the binary or
##   shared object dependencies

## EXAMPLE USAGE
##   Copy to a --prefix base a binary and its shared library linked dependencies
##   (--ldd) and ensure that all symlinks pointing to binary (--bin) are also
##   copied if those links are contained within a linked path (--links)
##
##     copy-bin.sh --prefix /base \
##                 --ldd /bin/busybox \
##                 --bin /bin/busybox \
##                 --links /bin \
##                 --links /sbin \
##                 --links /usr/bin \
##                 --links /usr/sbin
##
##   Alternate copy-bin.sh command doing the same thing
##
##     copy-bin.sh --prefix /base \
##                 --ldd /bin/busybox \
##                 --links /bin:/sbin:/usr/bin:/usr/sbin

## EXIT CODES
##   exit code 5
##     Help text was shown
##   exit code 127
##     Utility not found; you must install it because this script depends on it

##
## FUNCTIONS
##

## Stderror output
stderr() {
  echo "$@" >&2
}

## Verify app on exists
checkutil() {
  if ! type "$1" >/dev/null; then
    type "$1" >&2
  fi
}

## Only copy if nothing exists
cp_lite() {
  if [ -e "$prefix$1" ]; then
    return
  fi

  _cp_lite_basepath="$(dirname "$1")"

  mkdir -p "$prefix""$_cp_lite_basepath"

  cp -a "$1" "$prefix""$1"
}

## Help stderr output
help() {
  stderr '
DESCRIPTION
    A utility for copying binaries and shared object dependencies

SYNOPSIS
    copy-bin.sh --prefix PREFIX --ldd LDD [--bin BIN [[--links LINK] ...]]
    copy-bin.sh -p PREFIX -l LDD [-b BIN [[-L LINK] ...]]

OPTIONS
    --prefix PREFIX, -p PREFIX
        The destination to copy LDD files and bin symlinks

    --ldd LDD, -l LDD
        Read the binary at path LDD, copy it to PREFIX; run ldd utility on
        it and copy all shared object dependencies to PREFIX

    --bin BIN, -b BIN
        Symlinks should match destination bin. (does not perform copy)
        Defaults to LDD if not specified and --links is specified

    --links LINK, -L LINK
        Copy symlink LINK to PREFIX if it points to BIN. This option can
        be provided multiple times or colon:separated:paths provided
'
}

## Parse received args
parse_args() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --help | -h)
        help
        exit 5
        ;;
      --prefix | -p)
        prefix="$2"
        shift
        shift
        ;;
      --ldd | -l)
        ldd="$2"
        shift
        shift
        ;;
      --bin | -b)
        bin="$2"
        shift
        shift
        ;;
      --links | -L)
        if [ "$links" = "" ]; then
          links="$2"
        else
          links="$links:$2"
        fi
        shift
        shift
        ;;
      *)
        shift
        ;;
    esac
  done
  if [ ! "$ldd" = "" ] && [ "$bin" = "" ] && [ ! "$links" = "" ]; then
    bin="$ldd"
  fi
}

## Validate received arguments
validate_args() {
  _validate_args_errcode=0

  if [ "$prefix" = "" ]; then
    stderr "[timestamp: $(date +%F' '%T)] [level: ERROR] --prefix is required but not provided"
    _validate_args_errcode=5
  elif ! echo "$prefix" | grep '^/' >/dev/null; then
    stderr "[timestamp: $(date +%F' '%T)] [level: ERROR] --prefix must be a full path and not relative"
    _validate_args_errcode=5
  fi

  if [ ! "$ldd" = "" ]; then
    if [ ! -f "$ldd" ]; then
      stderr "[timestamp: $(date +%F' '%T)] [level: ERROR] --ldd must point to a regular file"
      _validate_args_errcode=5
    fi
  fi

  if [ ! "$links" = "" ]; then
    if [ "$bin" = "" ]; then
      stderr "[timestamp: $(date +%F' '%T)] [level: ERROR] --links were specified but --bin option not provided"
      _validate_args_errcode=5
    fi
  fi

  if [ ! "$_validate_args_errcode" = 0 ]; then
    stderr "[timestamp: $(date +%F' '%T)] [level: WARNING] view source of this script at: $(type "$0") or see 'copy-bin.sh --help' for details"
  fi

  return "$_validate_args_errcode"
}

## Reading links and turning them into absolute paths
deref_symlink() {
  _deref_symlink_deref="$(readlink "$1")"
  if [ "$_deref_symlink_deref" = "" ]; then
    return 1
  fi

  if ! echo "$_deref_symlink_deref" | grep '^/' >/dev/null; then
    _deref_symlink_basepath="$(dirname "$1")"
    _deref_symlink_deref="$_deref_symlink_basepath/$_deref_symlink_deref"
  fi

  if [ ! -e "$_deref_symlink_deref" ]; then
    return 1
  fi

  echo "$_deref_symlink_deref"
}

## Copy links path
copy_links() {
  if [ "$bin" = "" ]; then
    return
  fi

  _copy_links_deref=""
  echo "$links" | tr : '\n' | while read -r linkpath; do
    find "$linkpath" -maxdepth 1 -type l | while read -r linkfile; do
      ## Deref link or ignore dead links
      _copy_links_deref="$(deref_symlink "$linkfile")" || continue

      if [ ! "$bin" = "$_copy_links_deref" ]; then
        continue
      fi

      cp_lite "$linkfile"
    done
  done
}

## Trim spaces and sum, we leave only the paths to the libraries
parse_ldd() {
  awk 'NF == 2 && $1 ~ /^\// { print $1; next }; NF == 4 && $3 ~ /^\// { print $3 }' | sort -u
}

## Copying relative links and actual files to absolute paths
copy_with_links() {
  _copy_with_links_file="$1"
  _copy_with_links_recursion_limit=100
  _copy_with_links_rcount=0

  ## Keep dereferencing recursively and copy destination links
  while [ ! "$_copy_with_links_file" = "" ]; do
    cp_lite "$_copy_with_links_file"
    if _copy_with_links_file="$(deref_symlink "$_copy_with_links_file")"; then
      _copy_with_links_rcount="$((_copy_with_links_rcount + 1))"

      if [ "$_copy_with_links_rcount" -gt "$_copy_with_links_recursion_limit" ]; then
        stderr "[timestamp: $(date +%F' '%T)] [level: ERROR] too many links, recursed into $_copy_with_links_recursion_limit symlinks"
        exit 1
      fi

      continue
    fi

    unset _copy_with_links_file
  done
}

## Check ldd and launch copy method
copy_ldd() {
  if [ "$ldd" = "" ]; then
    return
  fi

  ldd "$ldd" 2>/dev/null | parse_ldd | while read -r file; do
    if [ "$file" = "" ]; then
      continue
    fi

    copy_with_links "$file"
  done

  cp_lite "$ldd"
}

##
## MAIN SCRIPT
##

## Exit on first error
set -e

main() {
  ## Pre-flight check for dependent utilities
  for i in awk cp dirname find grep ldd mkdir readlink sort tr xargs; do
    checkutil "$i"
  done

  ## Parse script arguments
  # prefix=""
  # ldd=""
  # bin=""
  # links=""
  parse_args "$@"
  validate_args

  ## Create directory if not exists
  [ -d "$prefix" ] || mkdir -p "$prefix"

  copy_ldd
  copy_links
}

## Launch entrypoint
main "$@"
