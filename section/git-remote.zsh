SKYLINE_VCS_REMOTE_PREFIX="${SKYLINE_VCS_REMOTE_PREFIX= }"
SKYLINE_VCS_REMOTE_SUFFIX="${SKYLINE_VCS_REMOTE_SUFFIX= }"
SKYLINE_VCS_GITHUB_ICON="${SKYLINE_VCS_GITHUB_ICON=\uf09b}"
SKYLINE_VCS_BITBUCKET_ICON="${SKYLINE_VCS_BITBUCKET_ICON=\uf171}"
SKYLINE_VCS_GITLAB_ICON="${SKYLINE_VCS_GITLAB_ICON=\uf296}"
SKYLINE_VCS_GIT_ICON="${SKYLINE_VCS_GIT_ICON=\uf7a1}"

skyline::git_remote_icon() {
  local icon
  case "$SKYLINE_VCS_STATUS_REMOTE_URL" in
    *github*)     icon="$(skyline::color ${SKYLINE_VCS_GITHUB_ICON} 117) $(skyline::color GitHub 223)";;
    *bitbucket*)  icon="${SKYLINE_VCS_BITBUCKET_ICON} Bitbucket";;
    *stash*)      icon="$(skyline::color ${SKYLINE_VCS_GITHUB_ICON} 117) $(skyline::color GitHub 223)";;
    *gitlab*)     icon="${SKYLINE_VCS_GITLAB_ICON} GitLab";;
    *)            icon="$(skyline::color ${SKYLINE_VCS_GIT_ICON} 196) $(skyline::color Git 223)";;
  esac

  skyline::section \
    white \
    $icon \
    $SKYLINE_VCS_REMOTE_PREFIX \
    $SKYLINE_VCS_REMOTE_SUFFIX
}