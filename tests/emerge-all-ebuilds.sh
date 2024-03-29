#!/usr/bin/env bash
# Get all non-live ebuilds that are in the git tree and emerge all of them in a clean stage3
set -e

if [ "${DEBUG}" = True ]; then
  set -x
fi

SCRIPT_PATH=$(dirname "$0")

#EBUILDS=($(git ls-files | grep -e "\.ebuild$" | egrep -v '.+9999(-r[0-9]+)?.ebuild'))
EBUILDS=$(grep -R -l "^KEYWORDS=\".*[~ ]amd64" `find . -name *.ebuild` | egrep -v '.+9999(-r[0-9]+)?.ebuild' | grep -vf tests/resources/blacklist.txt | sed -e "s/^\.\///")
echo "Emerging the following ebuilds: ${EBUILDS[@]}"

# Emerge the ebuilds in a clean stage3
"${SCRIPT_PATH}/emerge-ebuild.sh" "${EBUILDS[@]}"
