# macセットアップ

まずドットファイル・フォルダたちを`$HOME`に配置

## iTerm2
- [インストール手順](https://qiita.com/iwaseasahi/items/301e1f3b18aa49990763)
  - [これ](https://iterm2.com/)をダウンロード
  - zipファイルを展開
  - 開いたらApplications Folderに動かしてくれる
- altキーをmetaに
  - Preferences -> Profiles -> keys
  - Left/Right Option key acts as +Esc
- 画面大きさ
  - Preferences -> Profiles -> Window
  - StyleをMaximizedにする

## zsh

.zshrcに以下を追記

- `source ~/.zsettings`

## homebrew

- [インストール手順](https://brew.sh/index_ja)
  - `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

## tmux

```
brew extract --version=3.1 tmux homebrew/cask
brew install tmux@3.1
```

## その他

### ブラウザやMacのアプリでemacsのキーバインドを使う

```
mkdir ~/Library/KeyBindings
cp DefaultKeyBinding.dict ~/Library/KeyBindings
```
