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

skyline_prompt() {
  skyline::compose_prompt
}

prompt_skyline_setup() {
  PROMPT="$(skyline_prompt)"
}

prompt_skyline_setup "$@"

#PROMPT=$'%{$fg[blue]%}\u256D\u2500\ue0b2%f%{$bg[blue]%}%{$fg[black]%} \uf120 %k%{$fg[blue]%}%{$bg[white]%}\ue0b0%{$fg[black]%} %n %{$bg[black]%}%{$fg[white]%}\ue0c6%{$reset_color%}\n%{$fg[blue]%}\u2570\U2500\uf105%{$reset_color%} '
#RPROMPT=" <>"