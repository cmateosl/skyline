SKYLINE_GIT_STATUS_UNTRACKED="${SKYLINE_GIT_STATUS_UNTRACKED="?"}" # nf-fa-question_circle
SKYLINE_GIT_STATUS_ADDED="${SKYLINE_GIT_STATUS_ADDED="+"}" # nf-fa-plus_circle
SKYLINE_GIT_STATUS_MODIFIED="${SKYLINE_GIT_STATUS_MODIFIED="!"}" # nf-fa-exclamation_circle
SKYLINE_GIT_STATUS_RENAMED="${SKYLINE_GIT_STATUS_RENAMED="»"}" # nf-fa-arrow_circle_righ
SKYLINE_GIT_STATUS_DELETED="${SKYLINE_GIT_STATUS_DELETED="✘"}" #nf-fa-times_circle
SKYLINE_GIT_STATUS_STASHED="${SKYLINE_GIT_STATUS_STASHED="$"}" 
SKYLINE_GIT_STATUS_UNMERGED="${SKYLINE_GIT_STATUS_UNMERGED="="}"
SKYLINE_GIT_STATUS_AHEAD="${SKYLINE_GIT_STATUS_AHEAD="⇡"}"
SKYLINE_GIT_STATUS_BEHIND="${SKYLINE_GIT_STATUS_BEHIND="⇣"}"
SKYLINE_GIT_STATUS_DIVERGED="${SKYLINE_GIT_STATUS_DIVERGED="⇕"}"

skyline::git() {
  local git_current_branch="$vcs_info_msg_0_"
  [[ -z "$git_current_branch" ]] && return
  
  source "$SKYLINE_ROOT/section/git-status.zsh"
  source "$SKYLINE_ROOT/section/git-remote.zsh"

  skyline::git_status

  local branch_section="$(skyline::git_remote_icon) $SKYLINE_VCS_STATUS_LOCAL_BRANCH"
  skyline::section \
    green \
    $branch_section \
    "" \
    ""
}