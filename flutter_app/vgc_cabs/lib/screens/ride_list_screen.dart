import 'package:flutter/material.dart';
import 'package:vgc_cabs/models/ride.dart';
import 'package:vgc_cabs/services/api_service.dart';

class RideListScreen extends StatefulWidget {
  @override
  _RideListScreenState createState() => _RideListScreenState();
}

class _RideListScreenState extends State<RideListScreen> {
  List<Ride> _rides = [];

  @override
  void initState() {
    super.initState();
    _fetchRides();
  }

  Future<void> _fetchRides() async {
    try {
      List<Ride> rides = await ApiService.getRides();
      setState(() {
        _rides = rides;
      });
    } catch (e) {
      print('Error fetching rides: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ride List'),
      ),
      body: ListView.builder(
        itemCount: _rides.length,
        itemBuilder: (context, index) {
          Ride ride = _rides[index];
          return ListTile(
            title: Text(ride.title),
            subtitle: Text(ride.description),
            onTap: () {
              Navigator.pushNamed(context, '/ride_details', arguments: ride);
            },
          );
        },
      ),
    );
  }
}