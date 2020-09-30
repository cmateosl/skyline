# WORKING DIRECTORY
if [[ -z "$SKYLINE_ROOT" ]]; then
  export SKYLINE_ROOT=${${(%):-%x}:A:h}
fi

# CONFIGURATION
if [[ -z "$SKYLINE_PROMPT_ORDER" ]]; then
  SKYLINE_PROMPT_ORDER=(
    user
    dir
    git
  )
fi

SKYLINE_MAIN_COLOR="${SKYLINE_MAIN_COLOR=blue}"

# LOAD SOURCES
source "$SKYLINE_ROOT/lib/utils.zsh"
source "$SKYLINE_ROOT/lib/section.zsh"
source "$SKYLINE_ROOT/lib/hooks.zsh"

for section in $SKYLINE_PROMPT_ORDER; do
  if [[ -f "$SKYLINE_ROOT/section/$section.zsh" ]]; then
    source "$SKYLINE_ROOT/section/$section.zsh"
  else
    echo "Section '$section' have not been loaded."
  fi
done

# EXECUTE PROMPT
skyline_prompt() {
  skyline::compose_prompt $SKYLINE_PROMPT_ORDER
}

prompt_skyline_setup() {
  autoload -Uz vcs_info
  autoload -Uz add-zsh-hook

  prompt_opts=(cr percent sp subst)
  setopt noprompt{bang,cr,percent,subst} "prompt${^prompt_opts[@]}"

  add-zsh-hook precmd skyline::exec_vcs_info_precmd_hook
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git*' formats '%b'
  
  PROMPT='$(skyline_prompt)'
}

prompt_skyline_setup "$@"
