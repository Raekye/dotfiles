#!/usr/bin/env bash

GIT_AUTHOR="$(git config user.name) <$(git config user.email)>"

git rebase --root --rebase-merges --exec "git commit --amend --no-edit --author '$GIT_AUTHOR'"

git rebase --root --rebase-merges --committer-date-is-author-date
