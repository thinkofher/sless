PROMPT='[%{$fg[green]%}%n%{$reset_color%}%{$fg[green]%}@%{$reset_color%}%{$fg[green]%}%m%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%}$(git_prompt_info)]%{$fg[magenta]%}$%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
