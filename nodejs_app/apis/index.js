const express = require('express');
const rideRouter = require('./ride');

const apiRouter = express.Router();

apiRouter.use('/ride', rideRouter);

module.exports = apiRouter;