export PS1="\[\033[32m\]\w\[\033[0m\] $ "

alias gd='git diff'
alias gc='git commit'
alias gp='git push'
alias gs='git status'
alias ga='git add'
alias gl='git log'
alias gr='git checkout HEAD'

alias ll='ls -l'
alias la='ls -a'
alias ls='ls -G'

alias sea='brew search'
alias b='brew install'

alias d='cd ~/github/dotfiles'
alias a='time serverkit apply recipe.yml.erb'

alias s='cd ~/github/spec/spec/localhost'
alias ss='time rake'

alias t='cd /usr/local/Cellar/tomcat/8.5.15/libexec/webapps'

alias cls='clear'

eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
