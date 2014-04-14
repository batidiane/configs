# Use modern completion system

# Left-hand side prompt
PROMPT="[%D %*] %B%{$fg[cyan]%}%n@%m%{$reset_color%}%b:%B%{$fg[blue]%}%~%b%{$reset_color%} %{$fg[yellow]%}#%h%{$reset_color%} [%(?,%F{green}%?,%F{red}%?)%f] %# "

# Right-hand side prompt
RPROMPT='%(?,%B%F{green}:%)%b,%F{yellow}%? %B%F{red}:(%b)%f $(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}$(git_prompt_stash_count)'

ZSH_THEME_GIT_PROMPT_PREFIX="(git: %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} d"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} u"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} c"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} +"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} *"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} x"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ->"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} !"

ZSH_THEME_GIT_PROMPT_STASH_COUNT_BEFORE="%{$fg[yellow]%} [%{$fg[green]%}s"
ZSH_THEME_GIT_PROMPT_STASH_COUNT_AFTER="%{$fg[yellow]%] "

# git stash count
function git_prompt_stash_count(){
  COUNT=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
  if [ "$COUNT" -gt 0 ]; then
    echo "$ZSH_THEME_GIT_PROMPT_STASH_COUNT_BEFORE$COUNT$ZSH_THEME_GIT_PROMPT_STASH_COUNT_AFTER"
  fi
}

