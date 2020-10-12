SKYLINE_VCS_REMOTE_PREFIX="${SKYLINE_VCS_REMOTE_PREFIX= }"
SKYLINE_VCS_REMOTE_SUFFIX="${SKYLINE_VCS_REMOTE_SUFFIX= }"
SKYLINE_GIT_GITHUB_ICON="${SKYLINE_GIT_GITHUB_ICON=\uf113}"
SKYLINE_GIT_BITBUCKET_ICON="${SKYLINE_GIT_BITBUCKET_ICON=\uf171}"
SKYLINE_GIT_GITLAB_ICON="${SKYLINE_GIT_GITLAB_ICON=\uf296}"
SKYLINE_GIT_ICON="${SKYLINE_GIT_ICON=\uf1d3}"

skyline::git_remote_icon() {
  local icon
  case "$SKYLINE_VCS_STATUS_REMOTE_URL" in
    *github*)     icon="${SKYLINE_GIT_GITHUB_ICON} GitHub";;
    *bitbucket*)  icon="${SKYLINE_GIT_BITBUCKET_ICON} Bitbucket";;
    *stash*)      icon="${SKYLINE_GIT_GITHUB_ICON} GitHub";;
    *gitlab*)     icon="${SKYLINE_GIT_GITLAB_ICON} GitLab";;
    *)            icon="${SKYLINE_GIT_ICON} Git";;
  esac

  skyline::section \
    white \
    $icon \
    $SKYLINE_VCS_REMOTE_PREFIX \
    $SKYLINE_VCS_REMOTE_SUFFIX
}