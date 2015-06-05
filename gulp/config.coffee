srcDir = 'src'
destDir = 'public'

path =
  src:
    dir    : srcDir
    css    : srcDir + '/css/*.min.css'
    sass   : srcDir + '/css/app.sass'
    jade   : srcDir + '/*.jade'
    img    : srcDir + '/img/*'
    js     : './' + srcDir + '/js/**/*.js'
    coffee : './' + srcDir + '/js/main.coffee'
    jsx    : './' + srcDir + '/jsx/hostscript.coffee'
    csxs   : srcDir + '/CSXS/manifest.xml'
    debug  : srcDir + '/.debug'
  dest:
    dir    : destDir
    sass   : destDir + '/css'
    jade   : destDir
    img    : destDir + '/img'
    coffee : destDir + '/js/'
    jsx    : destDir + '/jsx/'
  watch:
    sass   : srcDir + '/**/*.sass'
    scss   : srcDir + '/**/*.scss'
    coffee : srcDir + '/**/*.coffee'
    jade   : srcDir + '/**/*.jade'
    png    : srcDir + '/**/*.png'
    jpg    : srcDir + '/**/*.jpg'
    gif    : srcDir + '/**/*.gif'
  deploy:
    src    : destDir + '/**/*'
    debug  : destDir + '/.debug'
    dest   : '/Users/<user>/Library/Application Support/Adobe/CEPServiceManager4/extensions/com.example.sampleext'

module.exports =
  path: path
