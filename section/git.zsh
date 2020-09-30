SKYLINE_GIT_STATUS_UNTRACKED="${SKYLINE_GIT_STATUS_UNTRACKED="?"}"
SKYLINE_GIT_STATUS_MODIFIED="${SKYLINE_GIT_STATUS_MODIFIED="!"}"

skyline::git() {
  local git_current_branch="$vcs_info_msg_0_"
  [[ -z "$git_current_branch" ]] && return

  skyline::bold "on "
  skyline::color $git_current_branch green

  local INDEX git_status=""
  INDEX=$(command git status --porcelain -b 2> /dev/null)
  
  # Check for untracked files
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    local count="$(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null | wc -l | awk '{$1=$1};1')"
    git_status="$SKYLINE_GIT_STATUS_UNTRACKED$count$git_status"
  fi

  # Check for modified files
  if $(echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null); then
    local count="$(echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null | wc -l | awk '{$1=$1};1')"
    git_status="$SKYLINE_GIT_STATUS_MODIFIED$count $git_status"
  fi

  echo -n " $git_status"
}