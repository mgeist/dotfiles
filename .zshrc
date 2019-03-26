# Prefer brew python
export PATH="/usr/local/opt/gnupg@2.0/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# Configure GOPATH
export GOPATH="$HOME/Projects/go"
export PATH="$PATH:/usr/local/go/bin"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export EDITOR="nvim"

# Set name of the theme to load. Optionally, if you set this to "random"
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dbprompt"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenvwrapper zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source ~/.bin/tmuxinator.zsh

alias fixsql="rm /usr/local/var/postgres/postmaster.pid"

alias vim="nvim"
alias vimrc="vim ~/.vimrc"
alias nvimrc="vim ~/.config/nvim/init.vim"
alias zshrc="vim ~/.zshrc"

# git aliases
alias gs="git status"
alias gco="git checkout"
alias ga="git add"
alias gfp="git fetch -p"
alias gr="git rebase"
alias gm="git merge"

# include hidden files and exclude .git in fzf searches
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# include aliases file
[ -f ~/zsh/aliases.zsh ] && source ~/zsh/aliases.zsh
# set up direnv
eval "$(direnv hook zsh)"
# include fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mat.geist/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mat.geist/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mat.geist/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mat.geist/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
