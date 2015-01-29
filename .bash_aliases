alias simpleServer="python -m SimpleHTTPServer"
alias chromeCrossD="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security"
alias gr="grunt"
alias hisgrep="history | grep -i"
alias gspresp="git stash && git pull --rebase && git stash pop"

/* replace vim with macvim */
/* alias vim="mvim -v" */

/* git aliases */
alias gs='git status '
alias ga='git add '
alias gap='git add -p'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

# php-fpm aliases
alias php-fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php55.plist"
alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php55.plist"
alias php-fpm.restart='php-fpm.stop && php-fpm.start'
