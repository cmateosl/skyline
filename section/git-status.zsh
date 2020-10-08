typeset SKYLINE_VCS_STATUS_LOCAL_BRANCH
typeset SKYLINE_VCS_STATUS_REMOTE_BRANCH
typeset SKYLINE_VCS_STATUS_REMOTE_NAME
typeset SKYLINE_VCS_STATUS_REMOTE_URL
typeset SKYLINE_VCS_STATUS_UNTRACKED_FILES
typeset SKYLINE_VCS_STATUS_MODIFIED_FILES

skyline::git_status() {
  SKYLINE_VCS_STATUS_LOCAL_BRANCH=`git branch --show-current`

  SKYLINE_VCS_STATUS_REMOTE_BRANCH=`git config branch.$git_current_branch.merge`
  SKYLINE_VCS_STATUS_REMOTE_NAME=`git config branch.$git_current_branch.remote`
  SKYLINE_VCS_STATUS_REMOTE_URL=`git config remote.$SKYLINE_VCS_STATUS_REMOTE_NAME.url`

  SKYLINE_VCS_STATUS_UNTRACKED_FILES=`git ls-files --others --exclude-standard 2> /dev/null`
  SKYLINE_VCS_STATUS_MODIFIED_FILES=`git ls-files -m 2> /dev/null`
}

skyline::git_status_icons() {
  
}