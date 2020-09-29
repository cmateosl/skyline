setopt PROMPT_SUBST
autoload colors
colors

PROMPT=$'%{$fg[orange]%}\ue0b2%f%{$bg[orange]%}%{$fg[black]%} \uf489 %k%{$fg[orange]%}\ue0b0%{$reset_color%}'
RPROMPT=" <>"