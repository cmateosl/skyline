setopt PROMPT_SUBST
autoload colors
colors

PROMPT=$'%{$fg[blue]%}\ue0b2%f%{$bg[blue]%}%{$fg[black]%} \uf120 %k%{$fg[blue]%}%{$bg[white]%}\ue0b0%{$fg[black]%} %n %{$bg[black]%}%{$fg[white]%}\ue0c6%{$reset_color%}\n> '
RPROMPT=" <>"