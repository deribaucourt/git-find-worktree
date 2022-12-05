# /usr/bin/awk

# Prints the sum of insertions and deletions in a `git diff --shortstat` result:
# 3401 files changed, 19515 insertions(+), 259792 deletions(-)

{
    insertions=$4
    deletions=$6
    print insertions + deletions
}
