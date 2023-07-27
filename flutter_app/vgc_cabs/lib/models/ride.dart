import 'package:flutter/material.dart';

class Ride {
  final String id;
  final String source;
  final String destination;
  final String date;
  final String time;
  final int seatsAvailable;
  final double fare;
  final String driverName;
  final String driverProfilePic;
  final String carModel;
  final String carNumber;

  Ride({
    @required this.id,
    @required this.source,
    @required this.destination,
    @required this.date,
    @required this.time,
    @required this.seatsAvailable,
    @required this.fare,
    @required this.driverName,
    @required this.driverProfilePic,
    @required this.carModel,
    @required this.carNumber,
  });
}