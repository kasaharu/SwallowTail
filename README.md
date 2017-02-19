# SwallowTail

* 個人用の LINE Bot を動かすためのリポジトリ
* Heroku で動かすことを前提としている

* 起動手順

```
$ git clone git@github.com:kasaharu/SwallowTail.git
$ cd SwallowTail/
$ bundle install
$ rails s
```

* Heroku に設定が必要な config

```
$ heroku config:set SECRET_KEY_BASE=`rake secret`
$ heroku config:set LINE_CHANNEL_TOKEN='xxx’
$ heroku config:set LINE_CHANNEL_SECRET=’xxx’
$ heroku config:set ANNICT_ACCESS_TOKEN='xxx’
```
