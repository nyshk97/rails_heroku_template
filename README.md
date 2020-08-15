## 開発環境をセットアップ
### Use this templateからリポジトリを複製
<img width="1440" alt=" 2020-08-15 18 29 37" src="https://user-images.githubusercontent.com/38527299/90309677-78b2f700-df25-11ea-9ffb-f9174eb43931.png">

### Docker環境の整備
```zsh
$ git clone https://github.com/nyshk97/project_name.git
$ cd project_name
# 必要に応じてRubyやRailsのバージョンを変更
$ docker-compose run web rails new . --force --no-deps --database=postgresql --skip-test
$ docker-compose build
$ docker-compose run web yarn upgrade
$ docker-compose up
$ docker-compose exec web rails db:create
$ docker-compose exec web rails db:migrate
$ docker-compose exec web rails db:seed
```
http://0.0.0.0:3000 にアクセスして表示を確認
Ctrl + Cでdocker-composeを終了

### VSCode Remote Developmentの設定
VSCode左下のマーク > Reopen in ContainerでVSCode Remote Containerを開く

http://0.0.0.0:3000 にアクセスして表示を確認

### 機能の確認
- Tailwind
- jquery
- 環境変数
- locale
- タイムゾーン
- タスク追加、編集、削除
- エラーメッセージの表示(4文字以下のタスクを入力)
- flash
- better_errors

### テストツール、解析ツールの動作確認
```zsh
$ rubocop
$ rails_best_practices .
$ brakeman
$ bin/rspec
```

### 秘匿情報の保護
envとdatabase.ymlをgit管理から外す

```
$ cp .env .env.default
$ cp config/database.yml config/database.yml.default
$ git rm -r --cached .env
$ git rm -r --cached config/database.yml
```
```.gitignore
.env
config/database.yml
```
```
$ git add -A
$ git commit
$ git push origin master
```

### overcommitの設定
```zsh
$ overcommit --sign
```
**Rubocop**
適当なcontrollerに`Time.now`を埋め込んでCommit

**RailsBestPractices**
適当なmodelに`default_scope order(created_at: :desc)`をセットしてCommit

**Brakeman**
適当なcontrollerに`http_basic_authenticate_with name: 'ID', password: 'password'`をセットしてPush

**RSpec**
パスしないテストを書いてPush

### Herokuアプリを作成
```zsh
$ heroku login --
heroku: Enter your login credentials
Email: hogehoge@gmail.com
Password: **************
Logged in as hogehoge@gmail.com
$ heroku create app-name #'_'は使えない
$ heroku config
$ heroku config:set TZ="Asia/Tokyo"
$ git push heroku master
```
https://app-name.herokuapp.com/ にアクセスして表示を確認

### TablePlusでDBに接続
#### dev
database.ymlを参照
#### 本番
本番は Heroku管理画面 > Resources > HerokuPostgres > Settings > View Credencials を参照

### DBのタイムゾーンを変更
それぞれのDBで以下を実行

```sql
show time zone;
ALTER DATABASE db_name SET timezone TO 'Asia/Tokyo';
```

再接続して、タイムゾーンが日本時間になっていることを確認

### 本番環境のログを管理
Papertrailを導入
Resources > Add ons からPatertrailsを検索して有効化

## 含まれているもの

## 本番公開時の設定
