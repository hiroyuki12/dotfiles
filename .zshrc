autoload colors
colors
PS1="%{$fg[green]%}%~%(!.#. %{$reset_color%}$) "
#SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
#RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"

alias tap='automator -v ~/github/dotfiles/automator/TapToClickOn.app/'
alias vo='nvim'

alias gd='git diff'
alias gc='git commit'
alias gp='git push'
alias gpu='git pull'
alias gs='git status'
alias ga='git add'
alias gl='git log'
alias glp='git log -p'
alias gls='git log --stat'
#alias gr='git checkout HEAD'
alias gche='git checkout'

alias ll='ls -l'
alias la='ls -a'
alias ls='ls -G'

alias sea='brew search'
alias b='brew install'
alias c='brew install --cask'
alias cov='cd ~/github/covid19'

alias d='cd ~/github/dotfiles'
alias a='time serverkit apply recipe.yml.erb'

alias cls='clear'

alias masxcode='time mas install 497799835'
alias masnas='time mas install 450664466'

alias maslist='mas list'
alias masversion='mas version'
alias masinstall='brew install mas'
alias maswunder='time mas install 410628904'
alias maspocket='time mas install 568494494'
alias mascoteditor='time mas install 1024640650'
alias mastodo='time mas install 1274495053'

alias bcode='time b Caskroom/cask/visual-studio-code'
alias q='exit'

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH=~/bin/flutter/bin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
eval "$(rbenv init -)"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.nodenv/shims:$PATH"
export PATH="$HOME/go/bin:$PATH"
export SOURCEKIT_TOOLCHAIN_PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain
eval "$(anyenv init -)"
export PATH="$HOME/.anyenv/envs/nodenv/bin:$PATH"
#export NODE_OPTIONS=--openssl-legacy-provider
export NODE_OPTIONS=""

# pnpm
export PNPM_HOME="/Users/hiroyuki/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# bun completions
[ -s "/Users/hiroyuki/.bun/_bun" ] && source "/Users/hiroyuki/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/hiroyuki/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
