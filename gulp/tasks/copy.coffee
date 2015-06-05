gulp        = require 'gulp'
browserSync = require 'browser-sync'
config      = require '../config'
paths        = config.path

gulp.task 'copy', ['imagemin'], ->
  gulp
    .src [ "#{paths.src.css}", "#{paths.src.js}", "#{paths.src.csxs}", "#{paths.src.debug}" ], { base: "#{paths.src.dir}" }
    .pipe gulp.dest( "#{paths.dest.dir}" )
    .pipe browserSync.reload({stream:true})

gulp.task 'copyWatch', ['copy'], ->
  gulp.start 'deploy'

gulp.task 'deploy', ["del_deploy"], ->
  gulp
    .src [ "#{paths.deploy.src}", "#{paths.deploy.debug}" ], { base: "#{paths.dest.dir}" }
    .pipe gulp.dest( "#{paths.deploy.dest}" )
