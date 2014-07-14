module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    globalConfig:
      root: ''
      css:  'assets/css'
      img:  'assets/img'
      js:   'assets/js'



    sass:
      build:
        expand: true
        cwd:  '<%= globalConfig.css %>'
        src:  '**/*.scss'
        dest: '<%= globalConfig.css %>'
        ext:  '.css'

    autoprefixer:
      options:
        browsers: ['last 2 version', 'ie 10', '> 1%']
      build:
        expand: true
        cwd:  '<%= globalConfig.css %>'
        src:  '**/*.css'
        dest: '<%= globalConfig.css %>'

    cssmin:
      build:
        expand: true
        cwd: '<%= globalConfig.css %>'
        src: '**/*.css'
        dest: '<%= globalConfig.css %>'
        ext: '.css'

        options:
          report: 'gzip'

    processhtml:
      build:
        files: {
          'processed.html':['index.html']
        }



  # !Load Tasks
  require("load-grunt-tasks") grunt



  grunt.registerTask 'default', [
    'sass'
    'autoprefixer'
#    'cssmin'
    'processhtml'
  ]

