local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}"
local user_host='%{$fg[green]%}%n%{$reset_color%}@%{$fg_bold[cyan]%}%m %{$reset_color%}'
local git_branch='$(git_prompt_info)'

if [ -n "$AWS_VAULT" ]; then
  local kubectl_context=$(kubectl config current-context | awk -F"/" '{print $2}')
fi


PROMPT="╭─${user_host}${kubectl_context}%{$fg[cyan]%}%~%{$reset_color%} ${git_branch}
╰${ret_status} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}) %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
