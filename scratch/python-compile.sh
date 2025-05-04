#!/usr/bin/env sh

set -ex

## Trick. Prevent error in compile and update timestamp
find . -name "*.py" -print0 | xargs -0 touch

## Compile w/ optimization
python -m compileall -q -f -j 4 -o 2 .

## Replace not optimized compiled files to optimized '*.pyc' files
find . -name "*.cpython-*.opt-2.pyc" | awk '{print $1, $1}' \
  | sed 's/__pycache__\///2' \
  | sed 's/.cpython-[0-9]\{2,\}.opt-2//2' \
  | xargs -n 2 mv

## Remove cache and not compiled files
find . -type f -name "*.py" -delete
find . -type d \( -name "test" -o -name "tests" -o -name "__pycache__" \) -exec rm -rf {} +

## Be careful to enable this
## Because may provoke error like this:
## importlib.metadata.PackageNotFoundError: No package metadata was found for pymisp
if [ "${1}" = 'dist-egg-info' ]; then
  find . -type d \( -name '*.dist-info' -o -name '*.egg-info' \) -exec rm -rf {} +
fi
