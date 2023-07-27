const express = require('express');
const router = express.Router();
const Ride = require('../models/ride');

// Get all rides
router.get('/', async (req, res) => {
  try {
    const rides = await Ride.find();
    res.json(rides);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Get a specific ride
router.get('/:id', getRide, (req, res) => {
  res.json(res.ride);
});

// Create a ride
router.post('/', async (req, res) => {
  const ride = new Ride({
    source: req.body.source,
    destination: req.body.destination,
    date: req.body.date,
    time: req.body.time,
    seatsAvailable: req.body.seatsAvailable,
    fare: req.body.fare,
    driver: req.body.driver
  });

  try {
    const newRide = await ride.save();
    res.status(201).json(newRide);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Update a ride
router.patch('/:id', getRide, async (req, res) => {
  if (req.body.source != null) {
    res.ride.source = req.body.source;
  }
  if (req.body.destination != null) {
    res.ride.destination = req.body.destination;
  }
  if (req.body.date != null) {
    res.ride.date = req.body.date;
  }
  if (req.body.time != null) {
    res.ride.time = req.body.time;
  }
  if (req.body.seatsAvailable != null) {
    res.ride.seatsAvailable = req.body.seatsAvailable;
  }
  if (req.body.fare != null) {
    res.ride.fare = req.body.fare;
  }
  if (req.body.driver != null) {
    res.ride.driver = req.body.driver;
  }

  try {
    const updatedRide = await res.ride.save();
    res.json(updatedRide);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Delete a ride
router.delete('/:id', getRide, async (req, res) => {
  try {
    await res.ride.remove();
    res.json({ message: 'Ride deleted' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

async function getRide(req, res, next) {
  let ride;
  try {
    ride = await Ride.findById(req.params.id);
    if (ride == null) {
      return res.status(404).json({ message: 'Cannot find ride' });
    }
  } catch (err) {
    return res.status(500).json({ message: err.message });
  }

  res.ride = ride;
  next();
}

module.exports = router;