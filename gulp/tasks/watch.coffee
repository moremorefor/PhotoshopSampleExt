gulp   = require 'gulp'
config = require '../config'
paths  = config.path

gulp.task 'watch', ->
  gulp.watch ["#{paths.watch.sass}", "#{paths.watch.scss}"], ['sassWatch']
  gulp.watch ["#{paths.watch.coffee}"], ['browserifyWatch']
  gulp.watch ["#{paths.watch.jsx}"], ['coffeeWatch']
  gulp.watch ["#{paths.watch.jade}"], ['jadeWatch']
  gulp.watch [
    "#{paths.watch.png}",
    "#{paths.watch.jpg}",
    "#{paths.watch.gif}"
  ], ['copyWatch']
