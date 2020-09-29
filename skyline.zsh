setopt PROMPT_SUBST
autoload colors
colors

PROMPT=$'%{$fg[blue]%}\ue0b2%f%{$bg[blue]%}%{$fg[black]%} \uf120 %k%{$fg[blue]%}\ue0b0%{$reset_color%}'
RPROMPT=" <>"