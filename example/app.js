'use strict';
const Http = require('http');
const server = Http.createServer((req, res) => {
  res.end('hello world');
}).listen(process.env.PORT);
