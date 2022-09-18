# Terminal Settings

## iTerm2

### なぜiTerm2が良いのか

- ホットキーで表示
- ウィンドウの透明度（あまり使ってないかも）

画面分割などはtmuxでやってるから実は旨味が少ないかも

### インストール

ダウンロードして、アプリケーションフォルダに配置

### ウィンドウの設定

- Preferences→Profiles
- デフォルトのプロファイル編集
    - Windowタブ
        - Style: Maximized
    - Keysタブ
        - Left optionとRight optionをEsc+にする
- 新しいプロファイルを追加
    - Windowタブ
        - Transparencyを50に、Blurを0に
        - Style: Maximized
    - Keysタブ
        - Left optionとRight optionをEsc+にする
        - A hotkey window opens a dedicated window with this profile.
            - Configure Hotkey Windowでホットキー設定
            - Animate showing and hidingはオフ

## Homebrew

[インストール手順](https://brew.sh/index_ja)

コマンドを実行

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## zsh

.zshrcに以下を追記

- `source ~/.zsettings`

読み込みを速くするためにコンパイル

```zsh
zcompile ~/.zshrc
```

設定の詳細については[こちら](Zsh.md)

## tmux

tmux 3.2ではShift + alt + 左右キーが効かなくなってしまったので、tmux 3.1をインストール

```zsh
brew extract --version=3.1 tmux homebrew/cask
brew install tmux@3.1
```

## git

### エイリアス

よく使っているエイリアス。自分用のPCなのでglobalです。

```zsh
git config --global alias.s status
git config --global alias.cm "commit -m"
git config --global alias.cam "commit --amend"
git config --global alias.dh "diff --cached"
git config --global alias.llog "log --graph --oneline"
git config --global alias.lloga "log --graph --oneline --all"
```