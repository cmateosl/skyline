SKYLINE_GIT_STATUS_UNTRACKED="${SKYLINE_GIT_STATUS_UNTRACKED="?"}"
SPACESHIP_GIT_STATUS_ADDED="${SPACESHIP_GIT_STATUS_ADDED="+"}"
SKYLINE_GIT_STATUS_MODIFIED="${SKYLINE_GIT_STATUS_MODIFIED="!"}"

skyline::git() {
  local git_current_branch="$vcs_info_msg_0_"
  [[ -z "$git_current_branch" ]] && return

  skyline::bold "on "
  skyline::color $git_current_branch green

  local INDEX git_status=""
  INDEX=$(command git status --porcelain -b 2> /dev/null)
  
  local count
  # Check for untracked files
  count="$(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null | wc -l | awk '{$1=$1};1')"
  (( $count > 0 )) && git_status="$SKYLINE_GIT_STATUS_UNTRACKED$count$git_status"

  # Check for staged files
  if $(echo "$INDEX" | command grep -E '^A[ MDAU] ' &> /dev/null); then
    count="$(echo "$INDEX" | command grep -E '^A[ MDAU] ' &> /dev/null | wc -l | awk '{$1=$1};1')"
    git_status="$SPACESHIP_GIT_STATUS_ADDED$count $git_status"
  elif $(echo "$INDEX" | command grep '^M[ MD] ' &> /dev/null); then
    count="$(echo "$INDEX" | command grep '^M[ MD] ' &> /dev/null | wc -l | awk '{$1=$1};1')"
    git_status="$SPACESHIP_GIT_STATUS_ADDED$count $git_status"
  elif $(echo "$INDEX" | command grep '^UA' &> /dev/null); then
    count="$(echo "$INDEX" | command grep '^UA' &> /dev/null | wc -l | awk '{$1=$1};1')"
    git_status="$SPACESHIP_GIT_STATUS_ADDED$count $git_status"
  fi

  # Check for modified files
  count="$(echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null | wc -l | awk '{$1=$1};1')"
  (( $count > 0 )) && git_status="$SKYLINE_GIT_STATUS_MODIFIED$count $git_status"

  echo -n " $git_status"
}