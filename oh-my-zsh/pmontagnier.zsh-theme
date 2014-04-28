# Use modern completion system

export LSCOLORS="Exfxcxdxbxegedabagacad"

# Left-hand side prompt
PROMPT="[%D %*] %B%{$fg[green]%}%n@%m%{$reset_color%}%b:%B%{$fg[blue]%}%~%b%{$reset_color%} %{$fg[yellow]%}#%h%{$reset_color%} [%(?,%F{green}%?,%F{red}%?)%f] %# "

# Right-hand side prompt
RPROMPT='%(?,%F{green}:%),%F{yellow}%? %F{red}:()%f $(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}$(git_prompt_stash_count)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="(git: %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} •"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} •"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} •"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} +"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} *"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} x"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ->"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} !"

ZSH_THEME_GIT_PROMPT_STASH_COUNT_BEFORE="%{$fg[yellow]%} [%{$fg[green]%}s"
ZSH_THEME_GIT_PROMPT_STASH_COUNT_AFTER="%{$fg[yellow]%}] "

# git stash count
function git_prompt_stash_count(){
  COUNT=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
  if [ "$COUNT" -gt 0 ]; then
    echo "$ZSH_THEME_GIT_PROMPT_STASH_COUNT_BEFORE$COUNT$ZSH_THEME_GIT_PROMPT_STASH_COUNT_AFTER"
  fi
}
