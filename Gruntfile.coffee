module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'
  grunt.initConfig
    pkg: pkg

    connect:
      livereload:
        options:
          port: 5000
          hostname:'*'
    
    watch:
      jade:
        files: "src/index.jade"
        tasks: ['jade','copy:deploy']
        options:
          livereload: true
          nospawn: true
      stylus:
        files: 'src/css/*.styl'
        tasks: ['stylus', 'copy:deploy']
        options:
          livereload: true
          nospawn: true
      coffee:
        files: 'src/js/*.coffee'
        tasks: ['coffee', 'copy:deploy']
        options:
          livereload: true
          nospawn: true
      jsx:
        files: 'src/jsx/*.coffee'
        tasks: ['coffee', 'copy:deploy']
        options:
          livereload: true
          nospawn: true

    copy:
      compile:
        files:[{
          expand: yes
          cwd: 'src'
          src: [ '**/*', '!**/*.{coffee,styl,jade}' ] #from
          dest: 'lib' #to
        }]
       deploy:
        files:[{
          expand: yes
          cwd: 'lib'
          src: [ '**/*', '*.debug' ] #from
          dest: '/Users/UserName/Library/Application Support/Adobe/CEPServiceManager4/extensions/com.example.sampleext' #to
        }]

    jade:
      options:
        data: pkg: pkg
      compile:
        files: [{
          expand: yes
          cwd: 'src'
          src: [ '*.jade', '**/*.jade' ]
          dest: 'lib'
          ext: '.html'
        }]

    stylus:
      options:
        compress: yes
      compile:
        files: [{
          expand: yes
          cwd: 'src'
          src: [ '*.styl', '**/*.styl' ]
          dest: 'lib'
          ext: '.css'
        }]

    coffee:
      compile:
        files: [{
          expand: yes
          cwd: 'src'
          src: 'js/*.coffee'
          dest: 'lib'
          ext: '.js'
        }]
      jsx:
        files: [{
          expand: yes
          cwd: 'src'
          src: 'jsx/*.coffee'
          dest: 'lib'
          ext: '.jsx'
        }]


    coffeelint:
      options:
        arrow_spacing:
          level: 'error'
        colon_assignment_spacing:
          spacing: left: 0, right: 1
          level: 'error'
        cyclomatic_complexity:
          level: 'warn'
        empty_constructor_needs_parens:
          level: 'error'
        indentation:
          value: 2
        max_line_length:
          value: 79
        newlines_after_classes:
          level: 'error'
        no_empty_functions:
          level: 'warn'
        no_empty_param_list:
          level: 'error'
        no_interpolation_in_single_quotes:
          level: 'warn'
        no_unnecessary_double_quotes:
          level: 'warn'
        no_unnecessary_fat_arrows:
          level: 'error'
        space_operators:
          level: 'warn'
      assets:
        files: [{
          expand: yes
          cwd: 'src'
          src: [ '*.coffee', '**/*.coffee' ]
        }]

    uglify:
      compile:
        files: [{
          expand: yes
          cwd: 'lib'
          src: [ '*.js', '**/*.js' ]
          dest: 'lib'
        }]


  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-compress'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-notify'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', [
    'copy:compile', 'jade', 'stylus', 'coffeelint', 'coffee', 'uglify', 'copy:deploy', 'connect', 'watch'
  ]
        
