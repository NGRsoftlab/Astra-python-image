#!/usr/bin/env sh

set -e

if [ -n "${pip_registry_index}" ] && [ -n "${pip_registry_url}" ] && [ -n "${pip_trusted_host}" ]; then
  pip3 config --global set \
    global.index "${pip_registry_index}"
  pip3 config --global set \
    global.index-url "${pip_registry_url}"
  pip3 config --global set \
    global.trusted-host "${pip_trusted_host}"
fi

if [ -n "${package_registry_proxy}" ] && [ -n "${package_registry_trust_host}" ]; then
  pip3 config --global set \
    global.index "${package_registry_proxy}/pypi"
  pip3 config --global set \
    global.index-url "${package_registry_proxy}/simple"
  pip3 config --global set \
    global.trusted-host "${package_registry_trust_host}"
fi

exit 0
