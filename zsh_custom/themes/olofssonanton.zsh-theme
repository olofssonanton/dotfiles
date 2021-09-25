local red="%{$FG[197]%}"
local green="%{$FG[034]%}"
local blue="%{$FG[032]%}"
local cyan="%{$FG[044]%}"
local magenta="%{$FG[165]%}"
local yellow="%{$FG[226]%}"
local white="%{$FG[015]%}"
local bold="%{$FX[bold]%}"
local reset="%{$reset_color%}"

if [[ -n $SSH_CONNECTION ]]; then
  local host_color="${bold}${magenta}"
else
  local host_color="$blue"
fi

local user_host="${green}%n${yellow}@${host_color}%m ${reset}"
local git_branch='$(git_prompt_info)'
local kubectl_context='$(kubectl_prompt_info)'
local ret_status="%(?:${bold}${green}➜ :${bold}${red}➜ )${reset}"

PROMPT="$white╭─${user_host}${cyan}%~${reset} ${git_branch}${kubectl_context}
${white}╰${ret_status} "

ZSH_THEME_GIT_PROMPT_PREFIX="${blue}("
ZSH_THEME_GIT_PROMPT_SUFFIX="${blue}) ${reset}"
ZSH_THEME_GIT_PROMPT_DIRTY="$red"
ZSH_THEME_GIT_PROMPT_CLEAN="$green"

ZSH_THEME_KUBECTL_PROMPT_PREFIX="${blue}[${yellow}"
ZSH_THEME_KUBECTL_PROMPT_SUFFIX="${blue}] ${reset}"
