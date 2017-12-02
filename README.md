# SwallowTail

* 個人用の LINE Bot を動かすためのリポジトリ
* Heroku で動かすことを前提としている

* 起動手順

```
$ git clone git@github.com:kasaharu/SwallowTail.git
$ cd SwallowTail/
$ bundle install --path vendor/bundler
$ rake assets:precompile
$ rails s
```

* Heroku に設定が必要な config

```
$ heroku config:set SECRET_KEY_BASE=`rake secret`
$ heroku config:set LINE_CHANNEL_TOKEN='xxx’
$ heroku config:set LINE_CHANNEL_SECRET=’xxx’
$ heroku config:set ANNICT_ACCESS_TOKEN='xxx’
$ heroku config:set A3RT_API_KEY='xxx’
$ heroku config:set BOT_NAME='xxx’
```

## Lint の実行

```
// Slim-Lint の実行
$ bundle exec slim-lint app/views/
```
