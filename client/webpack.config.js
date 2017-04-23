module.exports = {
  entry: {
    title_bar: './src/commons/title_bar.js',
    keyword_reply_table: './src/keyword_reply_table.js',
  },
  output: {
    path: '../app/assets/javascripts/webpack',
    filename: '[name].js',
  },
  module: {
    loaders: [
      {
        test: /\.(js|jsx)$/,
        loader: 'babel-loader',
        exclude: /node_modules/,
        query: {
          presets: ['es2015', 'react'],
        },
      }
    ]
  },
}
