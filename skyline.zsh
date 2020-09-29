setopt PROMPT_SUBST
autoload colors
colors

PROMPT=$'%{$fg[red]%}\uf438%{$bg[red]}\uf489 %k\uf44a%{$reset_color%}'
RPROMPT=" <>"