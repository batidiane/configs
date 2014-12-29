# Aliases

alias ls='ls --color'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lla='ls -Al'

alias ssudo='sudo -s -E'

alias gsm='screen /dev/ttyUSB0 57600 -t GSM'
alias hgdiff='hg diff | vim -R -'

alias gen-pass='cat /dev/urandom| tr -dc 'a-zA-Z0-9' | fold -w 64| head -n 1'

alias double-tunnel='echo "ssh -t -A -L 8081:localhost:8081 -D 8080 username@server1 ssh -D8081 username@server2"'

alias xrandr_addrightscreen="xrandr --output eDP1 --auto --primary --rotate normal --pos 0x0 --output DP2 --auto --rotate normal --right-of eDP1"
alias xrandr_removerightscreen="xrandr --output DP2 --off"
