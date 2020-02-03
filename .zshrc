# Created by newuser for 5.7.1
# エディタ設定
export EDITOR="emacs -nw"
alias emacs='emacs -nw'
alias em='emacs -nw'

# ファイル削除系
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# less
alias less='/usr/local/Cellar/less/530_1/bin/less -X'

# 色変更
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxf
alias ls='ls -G'

# prompt
autoload -Uz colors
colors
#PS1="%{${fg[cyan]}%}%n%{${reset_color}%}:%S%{$bg_bold[white]%}%{$fg[black]%}%c%{${reset_color}%}$ "
PS1="%F{cyan}%n%f:%B%c%b$ "

# Bash-like navigation
autoload -U select-word-style
select-word-style bash

# autocomplete
autoload -U compinit
compinit -u
setopt complete_in_word
zstyle ':completion:*:default' menu select=1
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt list_packed

# 履歴検索
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# 履歴保存
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_BEEP
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks  
setopt hist_save_no_dups
setopt hist_no_store

# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}

### search a destination from cdr list and cd the destination
function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N peco-cdr
bindkey '^V' peco-cdr

# julia path
alias julia='/usr/local/bin/julia'

# openni
export OPENNI2_INCLUDE=/usr/local/include/ni2
export OPENNI2_REDIST=/usr/local/lib/ni2
export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:${OPENNI2_REDIST}

# gradle
export PATH=$PATH:/opt/gradle-4.10.3/bin

# java
alias java='/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home/bin/java'
