# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="Dedicated user for forgejo-runner"

# Next to gitlab-runner ID, looks available
ACCT_USER_ID=511
ACCT_USER_GROUPS=( forgejo-runner )

ACCT_USER_HOME=/var/lib/forgejo-runner
ACCT_USER_HOME_PERMS=0770

acct-user_add_deps



