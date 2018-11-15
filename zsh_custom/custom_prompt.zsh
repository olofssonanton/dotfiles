# Outputs current branch info in prompt format (overriding default git_prompt_info)
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Outputs current JIRA-task info in prompt format
function jira_prompt_info() {
  if [ -z "$currentTask" ]; then
    return 0
  fi
  echo "$ZSH_THEME_JIRA_PROMPT_PREFIX$currentTask$ZSH_THEME_JIRA_PROMPT_SUFFIX"
}
