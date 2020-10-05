SKYLINE_GIT_BRANCH_PREFIX="${SKYLINE_GIT_BRANCH_PREFIX=""}"
SKYLINE_GIT_BRANCH_SUFFIX="${SKYLINE_GIT_BRANCH_SUFFIX=""}"
SKYLINE_GIT_BRANCH_COLOR="${SKYLINE_GIT_BRANCH_COLOR=green}"

skyline::git_branch() {
  git_current_branch="${git_current_branch##*\[}"
  git_current_branch="${git_current_branch%\|*}"

  echo -n $git_current_branch
}