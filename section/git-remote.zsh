SKYLINE_GIT_GITHUB_ICON="${SKYLINE_GIT_GITHUB_ICON=\uf113}"
SKYLINE_GIT_BITBUCKET_ICON="${SKYLINE_GIT_BITBUCKET_ICON=\uf171}"
SKYLINE_GIT_GITLAB_ICON="${SKYLINE_GIT_GITLAB_ICON=\uf296}"
SKYLINE_GIT_ICON="${SKYLINE_GIT_ICON=\uf1d3}"

skyline::git_remote_icon() {
  local icon
  case "$VCS_STATUS_REMOTE_URL" in
    *github*)     icon="${SKYLINE_GIT_GITHUB_ICON}";;
    *bitbucket*)  icon="${SKYLINE_GIT_BITBUCKET_ICON}";;
    *stash*)      icon="${SKYLINE_GIT_GITHUB_ICON}";;
    *gitlab*)     icon="${SKYLINE_GIT_GITLAB_ICON}";;
    *)            icon="${SKYLINE_GIT_ICON}";;
  esac
  echo -n $icon
}