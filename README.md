# LifeGauge-ios

### 開発環境構築
**開発環境を整える必要がない場合は、このステップはスキップ**

### 必要なアプリケーションおよびツールの導入
以下なツールを導入する
* bundler

#### bundleのインストール方法
RubyのGemパッケージ管理用のツール
以下のコマンドでインストールする
```bash
$ sudo gem install bundler
```
### プロジェクトの用意と設定
本リポジトリをローカルにクローンする
```bash
$ git clone https://github.com/ht-swear/LifeGauge-ios.git
```

以下のコマンドを実行する。
必要なライブラリのインストールと、証明書、Provisioning Profile のインストールが行われる
```bash
$ sh scripts/setup.sh
```
<!---->
<!--なお上記コマンド実行中に Passphrase の入力を求められた場合は、LastPass の `apple_certification_pass` というノートに記載されている Passphrase を入力します。-->
<!--```-->
<!--Enter the passphrase that should be used to encrypt/decrypt your certificates-->
<!--This passphrase is specific per repository and will be stored in your local keychain-->
<!--Make sure to remember the password, as you'll need it when you run match on a different machine-->
<!--Passphrase for Git Repo:-->
<!--Type passphrase again:-->
<!--```-->

### ファイル作成
[こいつ](https://qiita.com/YKEI_mrn/items/d1f79ceddf6e009fdcd0)使って、ファイル自動生成して管理してみたい

### タスク管理
GitHub Projectを使って開発タスクの管理を行なっています。<br>
ht-swear > Projects > Tasks で管理する <br>
https://github.com/orgs/ht-swear/projects/1

### Git運用
[こちら](https://scrapbox.io/ht-swear/Git_%E7%AE%A1%E7%90%86)を参考に

### リリース手順
