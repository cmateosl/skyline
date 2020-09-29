setopt PROMPT_SUBST
autoload colors
colors

PROMPT=$'%{$fg[red]%}\ue0b2%f%{$bg[red]%}\uf489 %k%{$fg[red]%}\ue0b0%{$reset_color%}'
RPROMPT=" <>"