#!/usr/bin/env zsh

# themes go in ~/.oh-my-zsh/themes/

# very basic copy of robbyrussell theme with added db name
# pulled from DATABASE_URL environment variable

function precmd {
        DB_NAME="${DATABASE_URL##*/}"
        if [ -n "$DB_NAME" ];then
                DB_STATUS=" %{$fg[cyan]%}db:(%{$fg[red]%}${DB_NAME}%{$fg[cyan]%}%B)%b"
        else
                DB_STATUS=""
        fi
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c${DB_STATUS} %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
