# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples

################################################################################
# ©2012-2013 Alef Burzmali
# Global .bashrc - edit .bashrc.local if you want to tune something
# 2012-01-17
################################################################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Load only one time
[ "$BASHRC_LOADED" == "loaded" ] && return
export BASHRC_LOADED=loaded

#-------------------------------------------------------------------------------
# Global parameters
#-------------------------------------------------------------------------------

# don't put duplicate lines in the history.
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# add timestamp to history
export HISTTIMEFORMAT="%d/%m %T "

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# history
# append, don't erase
shopt -s histappend

# do not try to complete empty lines
shopt -s no_empty_cmd_completion

# allow /**/file completion
shopt -s globstar

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

export EDITOR=vim

# ajouter ~/bin dans le PATH si celui-ci existe
if [ -d ~/bin ] ; then
  PATH=~/bin:"${PATH}"
fi

#-------------------------------------------------------------------------------
# TIme formats
#-------------------------------------------------------------------------------
export ls='--time-style=long-iso'
export TIMEFORMAT=$'\nreal\t%lR\nuser\t%lU\nsys\t%lS\n%%cpu\t%P'

#-------------------------------------------------------------------------------
# Colors
#-------------------------------------------------------------------------------

# enable color support of ls and grep
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto '$ls
    alias grep='grep --color=auto'
else
    alias ls='ls '$ls
fi

## Regular
declare -A fg_colors=([black]=30 [red]=31 [green]=32 [yellow]=33 [blue]=34 [purple]=35 [cyan]=36 [white]=37)
declare -A bg_colors=([black]=40 [red]=41 [green]=42 [yellow]=43 [blue]=44 [purple]=45 [cyan]=46 [white]=47)
declare -A styles=([normal]=0 [bold]=1 [italic]=3 [underline]=4 [inverse]=7 [crossed]=9)
# color:
#   color [reset]  			-- reset char
#	color $style $fg [$bg]	-- corresponding escape char 
function color()
{
	[ "$*" = "reset" ] && echo "\e[0m" && return
	[ $# -eq 2 ] && echo "\e[${styles[$1]:-0};${fg_colors[$2]:-0}m" && return
	[ $# -eq 3 ] && echo "\e[${styles[$1]:-0};${fg_colors[$2]:-0};${bg_colors[$3]:-0}m" && return
	echo "\e[0m" && return
}
# escaped characters to comply by PS1 requierements
function bashrc_color()
{
	echo "\[`color $*`\]"
}

#-------------------------------------------------------------------------------
# Prompt
#-------------------------------------------------------------------------------

# if root user: red instead of green
C_user_fg=green
[ $UID -eq "0" ] && C_user_fg=red

# used colors
C_reset=`bashrc_color reset`
C_default=`bashrc_color normal white black`
C_date=$C_default
C_chroot=`bashrc_color bold purple black`
C_user=`bashrc_color bold $C_user_fg black`
C_cwd=`bashrc_color bold blue black`
C_context=$C_default
C_cmdnb=`bashrc_color normal yellow black`
C_status_ok=`bashrc_color normal green black`
C_status_error=`bashrc_color normal red black`
C_prompt=`bashrc_color bold $C_user_fg`

# date
PS1_date="${C_date}[\D{%Y-%m-%d %H:%M:%S}]"

# chroot
# set variable identifying the chroot you work in (used in the prompt below)
[ -r /etc/debian_chroot ] && chrooted=$(cat /etc/debian_chroot)
PS1_chroot="${chrooted:+${C_chroot} ($chrooted)}"

# user@host:/work/dir
PS1_userhostdir="${C_user}\u@\h${C_default}:${C_cwd}\w"

# Level, Jobs, Command nb : (L:#SH_LVL|J:#Jobs) #Command
PS1_context="${C_context}(L:$SHLVL|J:\j) ${C_cmdnb}#\!"

# colored return code: [0], [255], ...
PS1_return="${C_default}[\
\`rcode=\$? ; rcolor=\"${C_status_error}\" ; [ \$rcode -eq 0 ] && rcolor=\"${C_status_ok}\" ; \
echo -n \"\$rcolor\$rcode\"\`\
${C_default}]"

# Prompt: \n$ ...
PS1_prompt="${C_reset}\n${C_prompt}\\$"

# [Return code] [2012-01-01 23:59:59] (nom_chroot) user@host: (L:#SH_LVL|J:#Jobs) #Command
# $ 
export PS1="${C_default}${PS1_date}${PS1_chroot} ${PS1_userhostdir} ${PS1_context} ${PS1_return} ${PS1_prompt}${C_reset} "

# Prompt for multiline commands
export PS2="${C_prompt}>${C_reset}  "

# save the history at each command
export PROMPT_COMMAND='history -a'
 
#-------------------------------------------------------------------------------
# Inclusions
#-------------------------------------------------------------------------------

# Profile
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

# Autocompletion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Local tunning
if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

#-------------------------------------------------------------------------------
# Nettoyage
#-------------------------------------------------------------------------------

unset chrooted
unset ls
unset BASHRC_LOADED
unset BASHPROFILE_LOADED
