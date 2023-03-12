#!/usr/bin/env bash
# Emerge a random live ebuild out of all the ebuilds in the overlay in a clean stage3
# Used to do continuous tests if our ebuilds still work
# as well as make sure the binary package cache is updated on our CI service
set -e

if [ "${DEBUG}" = True ]; then
  set -x
fi

SCRIPT_PATH=$(dirname "$0")

# Pick a random live ebuild
EBUILD=$(grep -R -l "^KEYWORDS=\".*[~ ]amd64" `find . -name *.ebuild` | egrep '.+9999(-r[0-9]+)?.ebuild' | grep -vf tests/resources/blacklist.txt | shuf -n1 | sed -e "s/^\.\///")

${SCRIPT_PATH}/emerge-ebuild.sh "${EBUILD}"
