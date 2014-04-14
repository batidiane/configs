# Setup the default editor
export EDITOR='vim'

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "/usr/local/bin" ] ; then
  PATH="/usr/local/bin:$PATH"
fi

# Aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# If RVM is needed
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Metasploit
# export MSF_DATABASE_CONFIG=/usr/local/share/metasploit-framework/database.yml
