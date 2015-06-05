gulp        = require 'gulp'
jade        = require 'gulp-jade'
browserSync = require 'browser-sync'
config      = require '../config'
paths       = config.path

gulp.task 'jade', ->
  gulp.src "#{paths.src.jade}"
    .pipe jade()
    .pipe gulp.dest("#{paths.dest.jade}")

gulp.task 'jadeWatch', ['jade'], ->
  gulp.start 'deploy'
