#!/usr/bin/env bash

set -e

#git show --no-patch --format='%ad' HEAD

git rebase --root --rebase-merges --exec "git commit --amend --no-edit --author '$(git config user.name) <$(git config user.email)>'"

git rebase --root --rebase-merges --committer-date-is-author-date
