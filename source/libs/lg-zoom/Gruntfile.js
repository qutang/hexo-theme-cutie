'use strict';
module.exports = function(grunt) {
    // Load all grunt tasks
    require('load-grunt-tasks')(grunt);

    // Show elapsed time at the end
    require('time-grunt')(grunt);

    grunt.loadNpmTasks('grunt-umd');
    grunt.loadNpmTasks('grunt-banner');

    // Project configuration.
    grunt.initConfig({
        // Metadata.
        pkg: grunt.file.readJSON('package.json'),
        banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
            '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
            '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
            '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
            ' Licensed GPLv3 */\n',

        // Task configuration.
        clean: {
            files: ['dist']
        },

        umd: {
            all: {
                options: {
                    src: 'src/<%= pkg.name %>.js',
                    dest: 'dist/<%= pkg.name %>.js',
                    deps: {
                        args : ['$'],
                        'default': ['$'],
                        amd: {
                            indent: 6,
                            items: ['jquery'],
                            prefix: '\'',
                            separator: ',\n',
                            suffix: '\''
                        },
                        cjs: {
                            indent: 6,
                            items: ['jquery'],
                            prefix: 'require(\'',
                            separator: ',\n',
                            suffix: '\')'
                        },
                        global: {
                            items: ['jQuery'],
                        },
                        pipeline: {
                            indent: 0,
                            items : ['jquery'],
                            prefix: '//= require ',
                            separator: '\n',
                        }
                    }
                }
            }
        },

        usebanner: {
            taskName: {
                options: {
                    position: 'top',
                    banner: '<%= banner %>',
                    linebreak: true
                },
                files: {
                    src: ['dist/<%= pkg.name %>.js']
                }
            }
        },

        /* jshint ignore:end */
        uglify: {
            options: {
                banner: '<%= banner %>'
            },
            dist: {
                files: [{
                    src: 'dist/<%= pkg.name %>.js',
                    dest: 'dist/<%= pkg.name %>.min.js'
                }]
            }
        },
        jshint: {
            options: {
                reporter: require('jshint-stylish')
            },
            gruntfile: {
                options: {
                    jshintrc: '.jshintrc'
                },
                src: 'Gruntfile.js'
            },
            src: {
                options: {
                    jshintrc: 'src/.jshintrc'
                },
                src: ['src/**/*.js']
            }
        },
        watch: {
            gruntfile: {
                files: '<%= jshint.gruntfile.src %>',
                tasks: ['jshint:gruntfile']
            },
            src: {
                files: '<%= jshint.src.src %>',
                tasks: ['jshint:src', 'qunit']
            },
            css: {
                files: 'src/**/*.scss',
                tasks: ['sass']
            }
        },
        connect: {
            server: {
                options: {
                    hostname: '0.0.0.0',
                    port: 9000
                }
            }
        }
    });

    // Default task.
    grunt.registerTask('default', ['jshint', 'connect', 'umd:all', 'uglify'/*, 'watch'*/, 'usebanner']);
    grunt.registerTask('server', function() {
        grunt.log.warn('The `server` task has been deprecated. Use `grunt serve` to start a server.');
        grunt.task.run(['serve']);
    });

    grunt.registerTask('serve', ['connect', 'watch']);
};
