# WORKING DIRECTORY
if [[ -z "$SKYLINE_ROOT" ]]; then
  export SKYLINE_ROOT=${${(%):-%x}:A:h}
fi

# CONFIGURATION
if [[ -z "#SKYLINE_PROMPT_ORDER" ]]; then
  SKYLINE_PROMPT_ORDER=()
fi

source "$SKYLINE_ROOT/lib/section.zsh"
source "$SKYLINE_ROOT/section/user.zsh"
source "$SKYLINE_ROOT/section/dir.zsh"

skyline_prompt() {
  skyline::compose_prompt
}

prompt_skyline_setup() {
  PROMPT="$(skyline_prompt)"
}

prompt_skyline_setup "$@"
