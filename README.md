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

## homebrew

- [インストール手順](https://brew.sh/index_ja)
  - `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

## zsh

- [インストール手順](https://qiita.com/iwaseasahi/items/a2b00b65ebd06785b443)
  - `brew install zsh`
  - `sudo vi /etc/shells`
    - 最後に `/usr/local/bin/zsh` を追加
  - `chsh -s /usr/local/bin/zsh`
  - ターミナル再起動
- cdrの保存ファイル用
  - `mkdir ~/.cache`
- lessの最新版
  - `brew install less`
  - （一応パスがあってるか確認？）

## emacs

- [インストール手順](https://qiita.com/hnw/items/d7d71dfcfecff80ad8f1)
  - `brew tap railwaycat/emacsmacport`
  - `brew install emacs-mac --with-modern-icon`
    - これってビルドしてるってことよね、ダウンロードでも良いかも
- メモフォルダ
  - `mkdir ~/memo/tmp`

## tmux

- `brew install tmux`
