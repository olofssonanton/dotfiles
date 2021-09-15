local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}"

if [[ -n $SSH_CONNECTION ]]; then
  local host_color='%{$fg_bold[blue]%}'
else
  local host_color='%{$fg_bold[magenta]%}'
fi
local user_host="%{\$fg[green]%}%n%{\$fg[yellow]%}@$host_color%m %{\$reset_color%}"

local git_branch='$(git_prompt_info)'
local kubectl_context='$(kubectl_prompt_info)'

PROMPT="╭─${user_host}%{$fg[cyan]%}%~%{$reset_color%} ${git_branch}${kubectl_context}
╰${ret_status} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}) %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

ZSH_THEME_KUBECTL_PROMPT_PREFIX="%{$fg_bold[blue]%}[%{$fg_bold[yellow]%}"
ZSH_THEME_KUBECTL_PROMPT_SUFFIX="%{$fg[blue]%}] %{$reset_color%}"
