SKYLINE_VCS_STATUS_UNTRACKED_ICON="${SKYLINE_VCS_STATUS_UNTRACKED_ICON=\uf440}"
SKYLINE_VCS_STATUS_MODIFIED_ICON="${SKYLINE_VCS_STATUS_MODIFIED_ICON=\uf040}"
SKYLINE_VCS_STATUS_STAGED_ICON="${SKYLINE_VCS_STATUS_STAGED_ICON=\uf417}"
SKYLINE_VCS_STATUS_STASH_ICON="${SKYLINE_VCS_STATUS_STASH_ICON=\uf435}"
SKYLINE_VCS_STATUS_UNPUSHED_ICON="${SKYLINE_VCS_STATUS_UNPUSHED_ICON=\uf40a}"

typeset SKYLINE_VCS_STATUS_LOCAL_BRANCH
typeset SKYLINE_VCS_STATUS_REMOTE_NAME
typeset SKYLINE_VCS_STATUS_REMOTE_URL
typeset SKYLINE_VCS_STATUS
typeset SKYLINE_VCS_STATUS_UNTRACKED_FILES
typeset SKYLINE_VCS_STATUS_MODIFIED_FILES
typeset SKYLINE_VCS_STATUS_STAGED_FILES
typeset SKYLINE_VCS_STATUS_STASH_FILES
typeset SKYLINE_VCS_STATUS_UNPUSHED_FILES

skyline::git_status() {
  SKYLINE_VCS_STATUS_LOCAL_BRANCH=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

  if [ "$SKYLINE_VCS_STATUS_LOCAL_BRANCH" != "HEAD" ]; then
    SKYLINE_VCS_STATUS_REMOTE_NAME=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2> /dev/null | cut -d"/" -f1)

    if [ ! -z "$SKYLINE_VCS_STATUS_REMOTE_NAME" ]; then
      SKYLINE_VCS_STATUS_REMOTE_URL=$(git config remote.$SKYLINE_VCS_STATUS_REMOTE_NAME.url)
      SKYLINE_VCS_STATUS_UNPUSHED_FILES=$(git log $SKYLINE_VCS_STATUS_REMOTE_NAME/$SKYLINE_VCS_STATUS_LOCAL_BRANCH..HEAD 2> /dev/null)
    fi
  fi

  SKYLINE_VCS_STATUS=$(git status -s 2> /dev/null)
  SKYLINE_VCS_STATUS_UNTRACKED_FILES=$(git ls-files --others --exclude-standard 2> /dev/null)
  SKYLINE_VCS_STATUS_MODIFIED_FILES=$(git ls-files -m 2> /dev/null)
  SKYLINE_VCS_STATUS_STAGED_FILES=$(git diff --name-only --cached 2> /dev/null)
  SKYLINE_VCS_STATUS_STASH_FILES=$(git stash list 2> /dev/null)
}

skyline::git_unpushed_icon() {
  if [[ ! -z $SKYLINE_VCS_STATUS_UNPUSHED_FILES ]]; then
    skyline::color "$SKYLINE_VCS_STATUS_UNPUSHED_ICON  " white
  fi
}

skyline::git_status_icons() {
  local content

  if [[ ! -z $SKYLINE_VCS_STATUS_UNTRACKED_FILES ]]; then
    content="$SKYLINE_VCS_STATUS_UNTRACKED_ICON $content"
  fi

  if [[ ! -z $SKYLINE_VCS_STATUS_MODIFIED_FILES ]]; then
    content="$SKYLINE_VCS_STATUS_MODIFIED_ICON $content"
  fi

  if [[ ! -z $SKYLINE_VCS_STATUS_STAGED_FILES ]]; then
    content="$SKYLINE_VCS_STATUS_STAGED_ICON $content"
  fi

  if [[ ! -z $SKYLINE_VCS_STATUS_STASH_FILES ]]; then
    content="$SKYLINE_VCS_STATUS_STASH_ICON $content"
  fi

  skyline::section "" $content " " ""
}