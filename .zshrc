# Prefer brew python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/Users/mat/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dbprompt"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

alias fixsql="rm /Users/mat/Library/Application Support/Postgres/var-9.4/postmaster.pid"

alias vim="nvim"
alias gs="git status"
alias gco="git checkout"
alias ga="git add"
alias vimrc="vim ~/.vimrc"
alias nvimrc="vim ~/.config/nvim/init.vim"
alias zshrc="vim ~/.zshrc"

[ -f ~/zsh/aliases.zsh ] && source ~/zsh/aliases.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
