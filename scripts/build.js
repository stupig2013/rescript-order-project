const webpack = require('webpack');
const rimraf = require('rimraf');
const path = require('path');
const webpackConfig = require('./webpack.config');

process.env.BABEL_ENV = 'production'
process.env.NODE_ENV = 'production'

function build() {

  const compiler = webpack(webpackConfig)

  rimraf(path.resolve(__dirname, '../dist'), () => {
    compiler.run((err, stats) => {
      if (err) {
        console.error(err)
        process.exit(1)
      }

      if (stats.compilation.errors && stats.compilation.errors.length) {
        console.error(stats.compilation.errors)
        process.exit(1)
      }

      console.log(stats.toString())
    })
  })
}

build()
