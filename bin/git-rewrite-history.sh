#!/usr/bin/env bash

set -e

#git show --no-patch --format='%ad' HEAD

# https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables
if test -z "$GIT_AUTHOR_NAME"; then
	GIT_AUTHOR_NAME="$(git config user.name)"
fi
if test -z "$GIT_AUTHOR_EMAIL"; then
	GIT_AUTHOR_EMAIL="$(git config user.email)"
fi

# Use --rebase-merges to preserve merge commits; otherwise, by default, merge commits will be dropped.
git rebase --root --exec "git commit --amend --no-edit"

git rebase --root --committer-date-is-author-date
