const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

const appRoot = path.resolve(__dirname, '..');
const isProd = process.env === 'production';

module.exports = {
  // bail: isProd,
  mode: isProd ? 'production' : 'development',
  target: 'web',
  devtool: isProd ? 'source-map' : 'cheap-module-source-map',

  entry: {
    index: path.resolve(appRoot, 'src/index.bs.js'),
  },

  output: {
    path: path.resolve(appRoot, 'dist'),
    filename: 'static/js/[name].js',
    chunkFilename: 'static/js/[name].js',
    // publicPath: '/'
  },

  resolve: {
    extensions: ['.bs.js', '.js']
  },

  optimization: {
    minimize: isProd,
    // minimizer: [
    //   new TerserPlugin({
    //     terserOptions: {
    //       compress: {
    //         ecma: 5,
    //         warnings: false,
    //         comparisons: false,
    //         inline: 2,
    //       },
    //       mangle: {
    //         safari10: true,
    //       },
    //       keep_classnames: false,
    //       keep_fnames: false,
    //       format: {
    //         ecma: 5,
    //         comments: false,
    //         ascii_only: true,
    //       },
    //     }
    //   })
    // ],
    splitChunks: {
      chunks: 'all',
      name: 'vendors',
    },
    moduleIds: isProd ? 'natural': 'named'
  },

  plugins: [
    new HtmlWebpackPlugin(
      {
        inject: true,
        template: path.resolve(appRoot, 'src/public/index.html'),
        minify: false
      },
    ),
    // new WebpackManifestPlugin({
    //   writeToFileEmit: true,
    // }),
  ],

  module: {
    rules: [
      {
        oneOf: [
          {
            test: /\.(js)$/,
            include: [
              path.resolve(appRoot, 'src')
            ],
            loader: require.resolve('babel-loader'),
            options: {
              presets: [
                [
                  require.resolve('@babel/preset-env')
                ],
              ],
              
              // directory for faster rebuilds.
              cacheDirectory: true,
              // See #6846 for context on why cacheCompression is disabled
              cacheCompression: false,
              compact: isProd,
            },
          },
        ]
      }
    ]
  },

  devServer: {
    // hot: false,
    liveReload: false,
    port: 8000,
    historyApiFallback: {
      index: `/index.html`
    },
    // static: [
    //   {
    //     directory: path.resolve(appRoot, 'src/public'),
    //     publicPath: '/static',
    //   },
    // ]
  }
}