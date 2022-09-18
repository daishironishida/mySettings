# Macbook Settings

## 設定ファイル配置

```zsh
cp .tmux.conf ~
cp .zsettings ~
cp DefaultKeyBinding.dict ~/Library/KeyBindings
```

## General Settings

### Dockを隠す

- Dockを自動的に表示 / 非表示をONにする

### 画面遷移のアクションを小さくする

- システム環境設定→アクセシビリティ→ディスプレイ→視差効果を減らす

### ブルーライトカット

- システム環境設定→ディスプレイ→Night Shift→スケジュールをカスタムにし、常につくようにする

### トラックパッド設定

- システム環境設定→トラックパッド→その他のジェスチャ
    - ページ間をスワイプをオフにする
        - 左右にスクロールしたい時に「元に戻る」になるのが嫌
    - アプリケーションExposeをオンにする
        - 同じアプリのウィンドウを全て表示

### デスクトップの順番固定

- システム環境設定→Mission Control
    - 「最新の使用状況に基づいて操作スペースを自動的に並べかる」をオフ

### ブラウザやMacのアプリでemacsのキーバインドを使う

Alt + fで単語移動、など

[DefaultKeyBinding.dict](../../DefaultKeyBinding.dict) を `~/Library/KeyBindings`に配置

### Finder設定

- 拡張子表示
    - Finder→環境設定→詳細→「全てのファイル名拡張子を表示」
- 新規ウィンドウをダウンロードフォルダにする
    - Finder→環境設定→一般→新規ウィンドウで表示するフォルダを選べる

## Terminal

[Terminal Settings](Terminal.md)参照

## XCode

### vimモード

- Editor→Vim Mode
- XCode 13.3.1ではメジャーな機能がまあまあサポートされてない（保存や繰り返しなど）

## Other useful apps

### ShiftIt

- アプリを画面左半分に移動したりするキーボードショートカット
- [https://github.com/fikovnik/ShiftIt/releases](https://github.com/fikovnik/ShiftIt/releases)
    - zipをダウンロードして、アプリケーションに配置
    - 起動すると色々設定できる
- キーはデフォルトでは押しにくいので良い感じに設定する
    - ^⌘←などが使いやすい