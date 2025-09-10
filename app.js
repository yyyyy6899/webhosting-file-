const https = require('https');
const http = require('http');
const fs = require('fs');
const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('Hello!');
});

const options = {
  key: fs.readFileSync('/path/to/key.pem'),
  cert: fs.readFileSync('/path/to/cert.pem')
};

// HTTPS on 443
https.createServer(options, app).listen(443, () => {
  console.log('Listening on port 443');
});

// HTTPS or HTTP on 8444
https.createServer(options, app).listen(8444, () => {
  console.log('Listening on port 8444');
});
