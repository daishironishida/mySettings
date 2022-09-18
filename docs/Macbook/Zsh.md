# zsh

環境を作る上で考えたメモ

### いろんな設定ファイル

.zshrc、.zprofile、.zshenvなどの違い

[https://suwaru.tokyo/zshenv/](https://suwaru.tokyo/zshenv/)

ぶっちゃけインタラクティブシェルは使わないし（使うとしてもログインシェルと同じ設定で良い）、シェルスクリプトで適用されてほしい設定とかない（と思う）ので、特に区別せず.zshrcを使えば良さそう

### 設定ファイル

.zshrcファイルに、ライブラリをインストールしたときに記述する内容と自分でカスタマイズした内容が混在するのが嫌なので、自分のカスタマイズ用のファイルを作成する。

.zshrcの最初にこれを書く

```bash
# Customize zsh environment
source ~/.zsettings
```

そして自分用カスタマイズのコマンドは~/.zsettingsに書き込んでいく。これはちゃんとメンテする。

ライブラリ用の初期化などは.zshrcや.zprofileなどに追記されていく。インストール時に勝手に書かれたりするので特にメンテしない

### プロンプト

良い感じの色で、ユーザー名とディレクトリを表示

```bash
autoload -Uz colors
colors
PS1="%F{cyan}%n%f:%B%c%b$ "
```

### 補完

大文字・小文字の区別しない、とか色々

```bash
autoload -U compinit
compinit -u
setopt complete_in_word
zstyle ':completion:*:default' menu select=1
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt list_packed
```

### 単語の区切りを/にする

単語で移動する時に/で区切れるようにする

```bash
autoload -U select-word-style
select-word-style bash
```

### lsで色を表示

ファイルの種類ごとに色を分ける

```bash
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxf
alias ls='ls -G'
```

### lessの最新版

地味な違いだけど、lessを抜けた時も表示されていてほしい。

.zsettingsに追記

```bash
alias less='/usr/bin/less -X'
```

### 履歴の保存

履歴の件数の説明

[https://tm.root-n.com/unix:zsh:histfile_histsize_savehist](https://tm.root-n.com/unix:zsh:histfile_histsize_savehist)

- HISTFILE：履歴ファイルの保存先。
- HISTSIZE：メモリに保存される履歴の件数。(保存数だけ履歴を検索できる)
- SAVEHIST：HISTFILE で指定したファイルに保存される履歴の件数。

zshのsetoptの引数の説明

[https://zsh.sourceforge.io/Doc/Release/Options.html](https://zsh.sourceforge.io/Doc/Release/Options.html)

- INC_APPEND_HISTORY：コマンド実行のたびにHISTFILEに書き込まれる
- SHARE_HISTORY：新しいコマンドをHISTFILEから読みこむ（並列実行中のシェルの履歴も読み込める？）
- HIST_SAVE_NO_DUPS：同じコマンドは保存しない
- HIST_FIND_NO_DUPS：同じコマンドは表示しない
- HIST_REDUCE_BLANKS：不要なスペースは削除する

### peco

```bash
brew install peco
```

### 履歴の検索

`^R` に割り当てる

```bash
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection
```

### ディレクトリの検索

まずキャッシュを保存するディレクトリ作成

```bash
mkdir ~/.cache
```

設定はどこかからコピったけど覚えてない

```bash
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
```

### コンパイル

```bash
zcompile ~/.zshrc
```

するとコンパイルされて読み込みが速くなる