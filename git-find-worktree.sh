#!/bin/bash -e

# A very basic tool to identify the original git commit from a working tree where
# the .git has been deleted.

# Inspired by https://stackoverflow.com/questions/49059767/git-find-commit-from-working-tree

BRANCH=$1
TOOL_PATH=$(dirname $0)

git rev-list ${BRANCH} | while read REVISION; do
    DIFFS=$(git diff --cached -w --shortstat ${REVISION} | awk -f ${TOOL_PATH}/diff-shortstat.awk)
    if [ -z "${DIFFS}" ]; then
        echo "Found the exact commit: " ${REVISION}
        exit 0
    fi
    if [ -z "${MIN_REV}" ] || [ ${DIFFS} -lt ${MIN_DIFFS} ]; then
        MIN_DIFFS=${DIFFS}
        MIN_REV=${REVISION}
        echo "Foud a closer commit: ${MIN_REV} with ${MIN_DIFFS} differences"
    fi
done
