PROMPT='%(!.%{$fg_bold[red]%}.%{$fg[magenta]%})%n@%m %{$fg[blue]%}%(!.%1~.%~) $(git_prompt_info)%#%{$reset_color%} '
RPROMPT='$(vi_mode_prompt_info)[%{%0(?,$fg_bold[green],$fg_bold[red])%}%?%{$reset_color%}]%{$fg_no_bold[green]%}[%*]%{$reset_color%}'
MODE_INDICATOR="%{$fg_bold[red]%}[❮]%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}●"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[green]%}↪"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}!!!!"

ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_DIVERGED="↯"
