# Migemo for Vim8

**WORK IN PROGRESS**

VimにMigemo検索を追加するプラグインです。

Vim8から導入されたChannel機能を使っているため、Vimのバージョンは8.0以上が必要です。

Channel機能を使う利点として、Kaoriyaパッチを適用する手間や、検索するたびに要するMigemoプロセスの起動処理が、削減されます。

## インストール方法
このプラグインは、他の多くのプラグインと同様にGitHubで管理しています。

プラグイン管理のdeinを導入済みであれば、設定ファイルに下記を追加してください。

```
call dein#add('oguna/migemo-for-vim8')
```


WindowsのMigemoは、KaoriYaで配布されている[C/Migemo](https://www.kaoriya.net/software/cmigemo/)を導入してください。
ダンロードして展開したディレクトリに含まれている、cmigemo.exe、migemo.dll、dictディレクトリを、
vim.exeのディレクトリ直下にコピーしてください。

Linux等ではパッケージマネージャで導入すると簡単です。

```
$ sudo apt install cmigmeo
```

## 使い方
ノーマルモードで `<leader>mi` キーを押すと、検索キーワードの入力が開始されます。
`<leader>` は標準ではバックスラッシュに設定されています。

検索したい文字列を入力してエンターを押すと、カーソルより前方で一致する箇所に移動します。
また、nキーを押すと、さらに前方一致検索を行います。
nキーを押すと一致文字列がハイライトしますが、このハイライトを解除するには、nohlsコマンドを利用してください。

## 今後の実装予定
- インクリメンタル検索への対応
