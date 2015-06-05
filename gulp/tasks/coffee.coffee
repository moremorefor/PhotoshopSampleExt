gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
browserSync = require 'browser-sync'
rename      = require 'gulp-rename'
config      = require '../config'
paths       = config.path

gulp.task 'coffee', ->
  gulp
    .src "#{paths.src.jsx}"
    .pipe coffee()
    .pipe rename({
      extname: '.jsx'
    })
    .pipe gulp.dest("#{paths.dest.jsx}")
    .pipe browserSync.reload({stream:true})

gulp.task 'coffeeWatch', ['coffee'], ->
  gulp.start 'deploy'
