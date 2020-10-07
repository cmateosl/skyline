typeset SKYLINE_VCS_STATUS_LOCAL_BRANCH
typeset SKYLINE_VCS_STATUS_REMOTE_BRANCH
typeset SKYLINE_VCS_STATUS_REMOTE_NAME
typeset SKYLINE_VCS_STATUS_REMOTE_URL

skyline::git_status() {
  SKYLINE_VCS_STATUS_LOCAL_BRANCH=`git branch --show-current`

  SKYLINE_VCS_STATUS_REMOTE_BRANCH=`git config branch.$git_current_branch.merge`
  SKYLINE_VCS_STATUS_REMOTE_NAME=`git config branch.$git_current_branch.remote`
  SKYLINE_VCS_STATUS_REMOTE_URL=`git config remote.$SKYLINE_VCS_STATUS_REMOTE_NAME.url`
}