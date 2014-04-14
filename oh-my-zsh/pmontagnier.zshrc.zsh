# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# don't put duplicate lines in the history.
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# add timestamp to history
export HISTTIMEFORMAT="%d/%m %T "

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e
