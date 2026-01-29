#!/usr/bin/env bash

set -Eeuo pipefail

## Check url for valid link
__validate_url() {
  if [[ $# -lt 1 ]]; then
    printf "%s" \
      "__validate_url requires at least one argument: <list-urls-to-check>"
    return 2
  fi

  local url re domain domain_length
  local -i error_count=0

  ## Strict check
  ## Schema
  re='^(https?|ftp)://'
  ## Auth
  re+='([^\/@]+(:([^\/@]|%[0-9a-fA-F]{2})*)?@)?'
  ## Domain
  re+='(([a-zA-Z0-9-]{1,63}\.)+[a-zA-Z]{2,63}|'
  ## IPv4
  re+='((25[0-5]|2[0-4][0-9]'
  re+='|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|'
  re+='[01]?[0-9][0-9]?)|'
  ## IPv6
  re+='(\[(([a-fA-F0-9]{1,4}:){7}[a-fA-F0-9]{1,4}|'
  re+='(:[a-fA-F0-9]{1,4}){1,7}|'
  re+='[a-fA-F0-9]{1,4}(:[a-fA-F0-9]{1,4}){1,7}|'
  re+='([a-fA-F0-9]{1,4}:){1,6}:[a-fA-F0-9]{1,4}|'
  re+='([a-fA-F0-9]{1,4}:){1,5}(:[a-fA-F0-9]{1,4}){1,2}|'
  re+='([a-fA-F0-9]{1,4}:){1,4}(:[a-fA-F0-9]{1,4}){1,3}|'
  re+='([a-fA-F0-9]{1,4}:){1,3}(:[a-fA-F0-9]{1,4}){1,4}|'
  re+='([a-fA-F0-9]{1,4}:){1,2}(:[a-fA-F0-9]{1,4}){1,5}|'
  re+='[a-fA-F0-9]{1,4}:((:[a-fA-F0-9]{1,4}){1,6})|'
  re+=':((:[a-fA-F0-9]{1,4}){1,7}|:)|'
  re+='fe80:(:[a-fA-F0-9]{0,4}){0,4}%[0-9a-zA-Z]+|'
  re+='::(ffff(:0{1,4})?:)?((25[0-5]|(2[0-4]|1?[0-9])?[0-9])\.){3}'
  re+='(25[0-5]|(2[0-4]|1?[0-9])?[0-9])|([a-fA-F0-9]{1,4}:){1,4}'
  re+=':((25[0-5]|(2[0-4]|1?[0-9])?[0-9])\.){3}(25[0-5]|(2[0-4]|1?[0-9])'
  re+='?[0-9]))\]))'
  ## Port
  re+='(:[0-9]{1,5})?'
  ## Path
  re+='(\/[^[:space:]?#]*)?'
  ## Query
  re+='(\?[^[:space:]#<>]*)?'
  ## Fragment
  re+='(\#[^[:space:]]*)?$'

  for url in "$@"; do
    ## Check main catch
    [[ ${url} =~ ${re} ]] || {
      : $((error_count++))
      continue
    }

    ## Check domain length
    if [[ ${url} =~ ://([^/@:]+) ]]; then
      domain=${BASH_REMATCH[1]%:*}
      [[ -n ${domain} ]] || {
        : $((error_count++))
        continue
      }
      domain_length=${#domain}
      if ((domain_length > 253)); then
        : $((error_count++))
        continue
      fi
    fi
  done

  return "${error_count}"
}

## Check first arg on exist
: "${1:?Define python version or URL and try again}"

install_python() {
  local full_version python_revision
  local desired="${1}"

  ## Check if identity is link or specific version
  if __validate_url "${desired}"; then
    ## Install deps
    apt-install.sh curl tar

    ## Download and install python from URL
    curl --silent \
      "${desired}" \
      | tar -C "/usr/local" --strip-components 1 -zx

    ## Remove deps
    apt-env.sh apt-remove.sh curl

    ## Define variables for /etc/environment
    python_revision='Installed-from-URL'

  ## Else installed base component form aptitude source
  else
    ## Update cache
    apt-env.sh apt-get update -qq

    ## Search python version on repository if received version is approximately
    full_version=$(apt-cache show python3-minimal \
      | grep -E '^Version:' \
      | grep "${desired}" \
      | sort -rV \
      | head -n1 \
      | awk '{print $2}' || echo '')

    ## Return error if version is not find
    [[ -n ${full_version} ]] || {
      echo "[Error]: Could not find python3 version matching '${desired}'" >&2
      return 1
    }

    ## Install python with deps
    apt-install.sh \
      "python3-minimal=${full_version}" \
      python3-pip \
      python3-venv

    ## Define variables for /etc/environment
    python_revision="${full_version}"
  fi

  ## Clean cache
  apt-clean.sh

  ## Filling /etc/environment
  local python_major_minor_patch_version python_major_minor_version
  python_major_minor_patch_version=$(python3 -c 'import platform; major, minor, patch = platform.python_version_tuple();print(f"{major}.{minor}.{patch}")')
  python_major_minor_version=$(python3 -c 'import platform; major, minor, patch = platform.python_version_tuple();print(f"{major}.{minor}")')
  {
    echo "PYTHON_MAJOR_MINOR_PATCH_VERSION=${python_major_minor_patch_version}"
    echo "PYTHON_MAJOR_MINOR_VERSION=${python_major_minor_version}"
    echo "PYTHON_REVISION=${python_revision}"
    echo "BEGIN_BUILD_IN_EPOCH=$(date '+%s')"
  } >>/etc/environment
}

install_python "${1}"

exit 0
