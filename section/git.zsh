SKYLINE_VCS_BRANCH_PREFIX="${SKYLINE_VCS_BRANCH_PREFIX=\ue725}"
SKYLINE_GIT_STATUS_UNTRACKED="${SKYLINE_GIT_STATUS_UNTRACKED=\uf440}" # nf-fa-question_circle
SKYLINE_GIT_STATUS_ADDED="${SKYLINE_GIT_STATUS_ADDED="+"}" # nf-fa-plus_circle
SKYLINE_GIT_STATUS_MODIFIED="${SKYLINE_GIT_STATUS_MODIFIED="!"}" # nf-fa-exclamation_circle
SKYLINE_GIT_STATUS_RENAMED="${SKYLINE_GIT_STATUS_RENAMED="»"}" # nf-fa-arrow_circle_righ
SKYLINE_GIT_STATUS_DELETED="${SKYLINE_GIT_STATUS_DELETED="✘"}" #nf-fa-times_circle
SKYLINE_GIT_STATUS_STASHED="${SKYLINE_GIT_STATUS_STASHED="$"}" 
SKYLINE_GIT_STATUS_UNMERGED="${SKYLINE_GIT_STATUS_UNMERGED="="}"
SKYLINE_GIT_STATUS_AHEAD="${SKYLINE_GIT_STATUS_AHEAD="⇡"}"
SKYLINE_GIT_STATUS_BEHIND="${SKYLINE_GIT_STATUS_BEHIND="⇣"}"
SKYLINE_GIT_STATUS_DIVERGED="${SKYLINE_GIT_STATUS_DIVERGED="⇕"}"

skyline::is_git() {
  [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]
}

skyline::git_branch() {
  local color="84"
  if [[ ! -z $SKYLINE_VCS_STATUS ]]; then
    color="228"
  fi
  
  skyline::section "" $SKYLINE_VCS_STATUS_LOCAL_BRANCH "$SKYLINE_VCS_BRANCH_PREFIX " ""
}

skyline::git() {
  skyline::is_git || return
  
  source "$SKYLINE_ROOT/section/git-status.zsh"
  source "$SKYLINE_ROOT/section/git-remote.zsh"

  skyline::bold "on"

  skyline::git_status

  skyline::git_remote_icon
  skyline::git_unpushed_icon

  local color=white
  if [[ ! -z $SKYLINE_VCS_STATUS_STAGED_FILES ]]; then
    color="84"
  elif [[ ! -z $SKYLINE_VCS_STATUS ]]; then
    color="228"
  fi
  
  local git_local="$(skyline::git_branch)$(skyline::git_status_icons)"
  skyline::section $color $git_local " " ""
}