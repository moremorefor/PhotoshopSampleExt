gulp        = require 'gulp'
browserSync = require 'browser-sync'
runSequence = require 'run-sequence'

gulp.task 'default', ['del'], ->
  runSequence(
    ['sass', 'browserify', 'coffee', 'jade', 'copy'],
    'deploy',
    'browser-sync',
    'watch'
  )
