# Setup the default editor
export EDITOR='vim'
export LC_ALL="fr_FR.UTF-8"

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
  export PATH="$HOME/.bin:$PATH"
fi

if [ -d "/usr/local/bin" ] ; then
  export PATH="/usr/local/bin:$PATH"
fi

if [ -d "/opt/bin" ] ; then
  export PATH="/opt/bin:$PATH"
fi

if [ -d "/opt/android-ndk" ] ; then
  export PATH="/opt/android-ndk:$PATH"
fi

if [ -d "/opt/android-sdk" ] ; then
  export PATH="/opt/android-sdk/tools:$PATH"
fi

# Some gems
if [ -d "$HOME/.gem/ruby/2.2.0/bin" ] ; then
  export PATH="$HOME/.gem/ruby/2.2.0/bin:$PATH"
fi

# Aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# If RVM is needed
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# SSH agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
