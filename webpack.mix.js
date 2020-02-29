const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

// npm install babel-eslint eslint eslint-config-prettier eslint-config-standard eslint-friendly-formatter eslint-loader eslint-plugin-html eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-node eslint-plugin-prettier eslint-plugin-promise eslint-plugin-standard eslint-plugin-vue laravel-mix-eslint --save-dev
// add .eslintrc.js



mix.js([
        'resources/js/app.js',
        'resources/js/sample.js',
        'resources/js/header.js',
       ],
        'public/js/main.js')
    .sass('resources/sass/main.scss', 'public/css');
