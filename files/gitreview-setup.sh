#!/usr/bin/env bash

git review -s
scp -p -P 29418 lourot@review.opendev.org:hooks/commit-msg .git/hooks/
git config core.hooksPath .git/hooks
git confemailwork
