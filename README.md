Use this templateからリポジトリを複製
```zsh
$ git clone https://github.com/nyshk97/project_name.git
$ cd project_name
$ docker-compose run web rails new . --force --no-deps --database=postgresql --skip-test
$ docker-compose build
$ docker-compose run web yarn upgrade
$ docker-compose up
$ docker-compose exec web rails db:create
$ docker-compose exec web rails db:migrate
$ docker-compose exec web rails db:seed
```
http:0.0.0.0:3000 にアクセスして表示を確認
Ctrl + Cでdocker-composeを終了
VSCode左下のマーク > Reopen in ContainerでVSCode Remote Containerを開く
機能の確認

- Tailwind
- jquery
- 環境変数
- locale
- タイムゾーン
- タスク追加、編集、削除
- エラーメッセージの表示(4文字以下のタスクを入力)
- flash
- better_errors

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
$ git add -A
$ git commit
$ git push origin master
```
