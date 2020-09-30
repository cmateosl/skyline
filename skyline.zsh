# WORKING DIRECTORY
if [[ -z "$SKYLINE_ROOT" ]]; then
  export SKYLINE_ROOT=${${(%):-%x}:A:h}
fi

# CONFIGURATION
if [[ -z "$SKYLINE_PROMPT_ORDER" ]]; then
  SKYLINE_PROMPT_ORDER=(
    user
    dir
  )
fi

SKYLINE_MAIN_COLOR="${SKYLINE_MAIN_COLOR=blue}"

# LOAD SOURCES
source "$SKYLINE_ROOT/lib/utils.zsh"
source "$SKYLINE_ROOT/lib/section.zsh"

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
  #for ((i=0; i<256; i++)); do echo "%F{$i}$i"; done
}

prompt_skyline_setup() {
  prompt_opts=(cr percent sp subst)
  setopt noprompt{bang,cr,percent,subst} "prompt${^prompt_opts[@]}"
  
  PROMPT='$(skyline_prompt)'
}

prompt_skyline_setup "$@"
