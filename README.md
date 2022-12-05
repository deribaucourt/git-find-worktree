# git-find-worktree

A  basic tool to identify the original git commit corresponding to a working
tree where the .git has been lost.

Unfortunately in the industry, poor practicies may lead to an original git
repository losing it's history contained in the .git directory. On top of this,
some modifications may be applied without keeping trace of the history.
Eventually, the git history will have to be recovered, wether to get updates
from upstream, or to publish the local modifications. For this, it is necessary
to find which commit the local working tree originated from.

This tool aims to do just that. For each commit on a given branch from the
original repository, it will compare the local working tree and report the
commit ID with the least differences.

This was inspired by the following stack overflow question : [git find commit from "working tree"](https://stackoverflow.com/questions/49059767/git-find-commit-from-working-tree)

## Dependencies

The following packages are required:
 - bash
 - git
 - awk

## How to use it

1. Clone the original repository corresponding to the working tree.

 $ git clone <url>
 $ cd <repository>

2. Erase all contents except the .git and overwrite with your working tree.

 $ rm -rf *
 $ cp -r <local-working-tree>/* .

3. Run the script with the name of the branch you want to examine.

 $ <path-to-this-tool>/git-find-worktree.sh master

You will get results like this:

```
Foud a closer commit: fe15f9983b180a927681260a4c4bb6c878595a1f with 335122 differences
Foud a closer commit: 329665d68b17479ccd11fa60479c9c7a8b2355a8 with 266970 differences
Foud a closer commit: 30a1502c5a62b5cc411bb9bfb2b6706b9e39f6d6 with 266940 differences
Foud a closer commit: 2e18f8f8180743d311b2690a275de3a3b9c0a140 with 266939 differences
Foud a closer commit: 8f02ab63160ddd234a8a0c028696be23388cd61e with 266850 differences

Closest commit is 8f02ab63160ddd234a8a0c028696be23388cd61e with 266850 differences
```
