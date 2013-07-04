# Aliases

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lla='ls -Al'

alias ssudo='sudo -s -E'

alias gsm='screen /dev/ttyUSB0 57600 -t GSM'
alias hgdiff='hg diff | vim -R -'

alias sniff_wifi='sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport sniff'

alias tunnel-ent='ssh -t -A -L 8081:localhost:8081 -D 8080 username@server1 ssh -D8081 username@user2'
