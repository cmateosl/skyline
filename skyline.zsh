setopt PROMPT_SUBST
autoload colors
colors

PROMPT=$'%{$fg[red]%}\uf438%f%{$bg[red]%}\uf489 %k%{$fg[red]%}\uf44a%{$reset_color%}'
RPROMPT=" <>"