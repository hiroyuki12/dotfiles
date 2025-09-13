autoload colors
colors
PS1="%{$fg[green]%}%~%(!.#. %{$reset_color%}$) "
#SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
#RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"
#PROMPT='%n@%m %1~ %#\n$ '

alias tap='automator -v ~/github/dotfiles/automator/TapToClickOn.app/'
alias vo='nvim'
alias suvi='sudo -H vim'
alias suv=suvi

alias gd='git diff'
alias gc='git commit'
alias gp='git push'
alias gpu='git pull'
alias gs='git status'
alias gss='git status -sb'
alias ga='git add'
alias gl='git log'
alias glp='git log -p'
alias glg="git log --stat --pretty=format:'%Cblue%h %Cgreen%ai %Cred%an %d
%Creset%s'"
alias gls='git log --stat'
alias glggo='git log --graph --oneline'
#alias gr='git checkout HEAD'
alias gche='git checkout'
alias grhh='git reset HEAD --hard'
alias grh1='git reset HEAD^'
alias grh1h='git reset HEAD^ --hard'
alias gshow='git show'
alias gsw='git switch'

alias jd='jj diff'
alias jc='jj describe -m '
alias jn='jj new'
alias jl='jj log'
alias js='jj status'

alias rm='rm -i'
alias mv='mv -i'
alias l='ls -CF'
alias ll='ls -l'
alias la='ls -a'
alias ls='ls -G'
alias l.='ls -d .[a-zA-Z]* --color=auto'

alias sea='brew search'
alias b='brew install'
alias c='brew install --cask'
alias cov='cd ~/github/covid19'

alias d='cd ~/github/dotfiles'
alias a='time serverkit apply recipe.yml.erb'

alias cls='clear'
alias ht=htop
alias grep='rg -i'
alias gre='grep -H -n -I --color=auto'
alias du=dust

alias masxcode='time mas install 497799835'
alias masnas='time mas install 450664466'

alias maslist='mas list'
alias masversion='mas version'
alias masinstall='brew install mas'
alias maswunder='time mas install 410628904'
alias maspocket='time mas install 568494494'
alias mascoteditor='time mas install 1024640650'
alias mastodo='time mas install 1274495053'

#alias ei="eza --icons --git"
#alias ea="eza -a --icons --git"
#jalias ee="eza -aahl --icons --git"
#alias et="eza -T -L 3 -a -I 'node_modules|.git|.cache' --icons"
#alias eta="eza -T -a -I 'node_modules|.git|.cache' --color=always --icons | less -r"
#alias ls=ei
#alias la=ea
#alias ll=ee
#alias lt=et
#alias lta=eta
#alias l="clear && ls"

alias bcode='time b Caskroom/cask/visual-studio-code'
alias q='exit'

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH=~/flutter/flutter/bin:$PATH
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

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/hiroyuki/.lmstudio/bin"

. "$HOME/.local/bin/env"

# uv
export PATH="$HOME/.local//bin:$PATH"
