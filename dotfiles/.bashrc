#
# ~/.bashrc
#

export EDITOR='vim'
export CLICOLOR=1
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable history appending instead of overwriting.
shopt -s histappend

use_color=true
# sanitize TERM:
safe_term=${TERM//[^[:alnum:]]/?}
match_lhs=""

if ${use_color} ; then
  # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
  if type -P dircolors >/dev/null ; then
    if [[ -f ~/.dir_colors ]] ; then
      eval $(dircolors -b ~/.dir_colors)
    elif [[ -f /etc/DIR_COLORS ]] ; then
      eval $(dircolors -b /etc/DIR_COLORS)
    fi
  fi

  if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
  else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
  fi

  alias grep='grep --color'

else
  if [[ ${EUID} == 0 ]] ; then
    # show root@ when we do not have colors
    PS1='\u@\h \W \$ '
  else
    PS1='\u@\h \w \$ '
  fi
fi

PS2='> '
PS3='> '
PS4='+ '

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Try to keep environment pollution down, EPA loves us.
unset use_color safe_term match_lhs

PATH=$PATH:/usr/local/sbin
export PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
