#!/usr/bin/env bash

set -e

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build \
  --tag 'archlinux:aur-test' \
  "${SCRIPT_PATH}"

docker run \
  --rm \
  --volume "${SCRIPT_PATH}/aur-test.sh:/aur-test.sh:ro" \
  --volume "${SCRIPT_PATH}/packages.txt:/packages.txt:ro" \
  'archlinux:aur-test' \
  /aur-test.sh
