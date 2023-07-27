import 'package:flutter/material.dart';
import 'package:vgc_cabs/models/ride.dart';
import 'package:vgc_cabs/services/api_service.dart';

class RideDetailsScreen extends StatefulWidget {
  final Ride ride;

  RideDetailsScreen({required this.ride});

  @override
  _RideDetailsScreenState createState() => _RideDetailsScreenState();
}

class _RideDetailsScreenState extends State<RideDetailsScreen> {
  ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ride Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ride ID: ${widget.ride.id}'),
            Text('Source: ${widget.ride.source}'),
            Text('Destination: ${widget.ride.destination}'),
            Text('Date: ${widget.ride.date}'),
            Text('Time: ${widget.ride.time}'),
            ElevatedButton(
              onPressed: () {
                _apiService.bookRide(widget.ride.id);
              },
              child: Text('Book Ride'),
            ),
          ],
        ),
      ),
    );
  }
}