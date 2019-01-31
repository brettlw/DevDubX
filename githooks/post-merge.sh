#!/bin/sh
# git hook to run a command after `git pull`
# checks if in specific branch and makes a change
# put it into `.git/hooks/`.

current_branch="$(git branch -l | grep "* ")"

sinTestingBranch="https://cdn.jsdelivr.net/gh/brettlw/DevDubX/testing"
sinMasterBranch="https://cdn.jsdelivr.net/gh/brettlw/DevDubX/master"
fgDevBranch="https://rawgit.com/FranciscoG/DevDubX/dev"

function fixGitRoot() {
  sed -E -i '' "s,https://rawgit.com/[A-Za-z0-9]+/DevDubX/[A-Za-z0-9]+,${1},g" beta.js
}

echo "Currently in branch: ${current_branch}"

if [[ $current_branch == *"testing"* ]]; then
  echo "changing gitRoot to: ${sinTestingBranch}"
  fixGitRoot $sinTestingBranch

elif [[ $current_branch == *"master"* ]]; then
  echo "changing gitRoot to: ${sinMasterBranch}"
  fixGitRoot $sinMasterBranch

elif [[ $current_branch == *"FranciscoG/DevDubX/dev"* ]]; then
  echo "changing gitRoot to: ${fgDevBranch}"
  fixGitRoot $fgDevBranch

else
  echo ""
fi
