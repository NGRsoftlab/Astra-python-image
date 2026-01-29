# syntax=docker/dockerfile:1.7-labs

## Definite image args
ARG image_registry
ARG image_name=astra
ARG image_version=1.8.2-slim

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                         Base image                          #
#               First stage, prepare environment              #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
FROM ${image_registry}${image_name}:${image_version} AS base-stage

SHELL [ "/bin/bash", "-exo", "pipefail", "-c" ]

## Define DEFAULT args
ARG python_identity='3.11'
ARG pip_registry_index
ARG pip_registry_url
ARG pip_trusted_host

## ENV for app
ENV \
    PYTHON_VENV_PATH='/usr/local/lib/python-venv' \
    PYTHONDONTWRITEBYTECODE=1 \
    LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/ssl"

## Copy issue
COPY docs/issue /etc/issue

## Install and setup application
RUN \
    --mount=type=bind,source=./scripts,target=/usr/local/sbin,readonly \
    apt-install.sh \
## Small init process
        dumb-init \
    && python-install-approximately.sh "${python_identity}" \
## Set corporative proxy
    && python-set-proxy.sh \
## Mock test
    && python3 --version \
    && pip3 --version \
## Remove history sensitive data
    && env -C /root rm -f .bash_history .python_history .wget-hsts \
## Enable venv
    && python3 -m venv "${PYTHON_VENV_PATH}" \
## Global remove cache
    && PYTHON_SITE_PACKAGES="$(python3 -c 'import site;print(site.getsitepackages()[0])')" \
    && PYTHON_OS_FILE="$(python3 -c 'import os as _;print(_.__file__)')" \
    && PYTHON_LIB_PATH="${PYTHON_OS_FILE%/*}" \
## Add to environment
    && echo "PYTHON_LIB_PATH=${PYTHON_LIB_PATH}" >> /etc/environment \
    && echo "PYTHON_SITE_PACKAGES=${PYTHON_SITE_PACKAGES}" >> /etc/environment \
## Remove mess and weightily packages
    && rm -rfv \
        /usr/bin/idle* \
        ## Disabled, but if u don't work with python metadata - uncomment this
        # /usr/bin/pydoc* \
        # "${PYTHON_LIB_PATH}/pydoc.py" \
        # "${PYTHON_LIB_PATH}/pydoc_data" \
        "${PYTHON_LIB_PATH}/ensurepip/_bundled" \
        "${PYTHON_LIB_PATH}/idlelib" \
        "${PYTHON_LIB_PATH}/doctest.py" \
        "${PYTHON_LIB_PATH}/tkinter" \
        "${PYTHON_LIB_PATH}/turtle.py" \
        "${PYTHON_LIB_PATH}/turtledemo" \
    && find "${PYTHON_SITE_PACKAGES}/" -iname '*.exe' -ls -delete \
    && find "${PYTHON_LIB_PATH}/" -iname '*.exe' -ls -delete \
    && find "${PYTHON_LIB_PATH}/" -type f -name "test.py" -delete \
    && find "${PYTHON_VENV_PATH}/" -type f -name "test.py" -delete \
    && find "${PYTHON_VENV_PATH}" -iname '*.exe' -ls -delete

## Add venv into path
ENV PATH="${PYTHON_VENV_PATH}/bin:${PATH}"

## Install pip deps into venv
# hadolint ignore=DL3042
RUN \
    --mount=type=bind,source=./scripts,target=/usr/local/sbin,readonly \
    pip-env.sh pip install \
        'setuptools==65.5.1' \
        # https://github.com/docker-library/python/issues/1023
        'wheel<0.46' \
    && pip-env.sh pip list --format freeze \
        | grep -F '==' | awk -F= '{print $1}' \
        | xargs -r pip-env.sh pip install -U \
## Global remove cache
    && PYTHON_VENV_SITE_PACKAGES="$(python3 -c 'import site;print(site.getsitepackages()[0])')" \
    && python-rm-cache.sh "${PYTHON_VENV_SITE_PACKAGES}" \
    && rm -rfv "${PYTHON_VENV_PATH}/include" \
    && python-rm-cache.sh /usr/ \
    && python-global-rm-cache.sh /usr/ \
## Deduplication cleanup
    && dedup-clean.sh /usr/ \
## Make some useful symlinks that are expected to exist ("/usr/local/bin/python" and friends)
    && python-linkin.sh \
## Get image package dump
    && mkdir -p /usr/share/rocks \
    && ( \
        echo "# os-release" && cat /etc/os-release \
        && echo "# dpkg-query" \
        && dpkg-query -f \
            '${db:Status-Abbrev},${binary:Package},${Version},${source:Package},${Source:Version}\n' \
            -W \
        ) >/usr/share/rocks/dpkg.query \
## Check can be preview /etc/issue
    && { \
        grep -qF 'cat /etc/issue' /etc/bash.bashrc \
        || echo 'cat /etc/issue' >> /etc/bash.bashrc; \
    }

## Copy entrypoint
COPY scripts/docker-entrypoint.sh /usr/local/sbin/docker-entrypoint.sh

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                        Final image                          #
#             Second stage, compact optimize layer            #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
FROM scratch

COPY --from=base-stage / /

## Set base label
LABEL \
    maintainer="Vladislav Avdeev" \
    organization="NGRSoftlab"

## Set work env for pip and python
ENV \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHON_VENV_PATH='/usr/local/lib/python-venv' \
    LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/ssl"

## Add venv into path
ENV PATH="${PYTHON_VENV_PATH}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

## Set work directory
WORKDIR /

ENTRYPOINT [ "dumb-init", "docker-entrypoint.sh" ]
