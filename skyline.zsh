setopt PROMPT_SUBST
autoload colors
colors

PROMPT=$'%{$fg[blue]%}\u256D\u2500\ue0b2%f%{$bg[blue]%}%{$fg[black]%} \uf120 %k%{$fg[blue]%}%{$bg[white]%}\ue0b0%{$fg[black]%} %n %{$bg[black]%}%{$fg[white]%}\ue0c6%{$reset_color%}\n%{$fg[blue]%}\u2570\U2500\uf105%{$reset_color%} '
RPROMPT=" <>"