# Setup the default editor
export EDITOR='vim'

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -d "/usr/local/bin" ] ; then
  export PATH="/usr/local/bin:$PATH"
fi

if [ -d "/opt/bin" ] ; then
  export PATH="/opt/bin:$PATH"
fi

# Aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# ARM cross-compilation
if [ -z $ARM_CROSSCOMPILE ]; then
  if [ -d "$HOME/arm-cs-tools" ]; then
    export PATH="$HOME/arm-cs-tools/bin:$PATH"
  fi
fi

# If RVM is needed
if [ -z $RVM ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

# Metasploit
if [ -z $METASPLOIT ]; then
  export MSF_DATABASE_CONFIG=/usr/local/share/metasploit-framework/database.yml
fi

if [ -z $PWNTOOLS ]; then
  # Pwntools binaries
  if [ -d "$HOME/Documents/development/pwntools/bin" ]; then
    export PATH="$HOME/Documents/development/pwntools/bin:$PATH"
  fi

  # Pwntools python libs
  if [ -d "$HOME/Documents/development/pwntools/lib" ]; then
    export PYTHONPATH="$HOME/Documents/development/pwntools/lib:$PYTHONPATH"
  fi
fi
