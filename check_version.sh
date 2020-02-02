#!/bin/bash -Eeu

readonly IMAGE_NAME=cyberdojofoundation/ubuntu-build-essential:18.04

readonly MY_DIR="$( cd "$( dirname "${0}" )" && pwd )"
readonly EXPECTED=18.04
readonly ACTUAL=$(docker run --rm -it ${IMAGE_NAME} sh -c '. /etc/os-release && echo ${VERSION_ID}')

if echo "${ACTUAL}" | grep -q "${EXPECTED}"; then
  echo "VERSION CONFIRMED as ${EXPECTED}"
else
  echo "VERSION EXPECTED: ${EXPECTED}"
  echo "VERSION   ACTUAL: ${ACTUAL}"
  exit 42
fi
