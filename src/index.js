'use strict';
const express = require('express');
const Magic = require('magic-root').Magic;
const config = require('./config');
const app = express();
app.set('port', config.port);

Magic(app, process.cwd());
