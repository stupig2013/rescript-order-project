const webpack = require('webpack');
const WebpackDevServer = require('webpack-dev-server');
const webpackConfig = require('./webpack.config');

function compile(config) {
  let compiler;
  try {
    compiler = webpack(config);
  } catch (e) {
    console.error(e);
    process.exit(1);
  }
  return compiler;
}

const compiler = compile(webpackConfig);

const sevServer = new WebpackDevServer(
  webpackConfig.devServer,
  compiler
);

sevServer.start(() => {
  console.log(`devServer start on port ${webpackConfig.devServer.port}`)
});