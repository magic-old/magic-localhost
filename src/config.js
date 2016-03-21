const config = {
  port: 80,
  host: 'localhost',
  babel: {
    srcPath: 'js',
    cachePath: __dirname + '/_cache',
    babelOptions: {
      presets: ['es2015', 'stage-0'],
    },
  },
};
