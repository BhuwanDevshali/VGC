import 'package:flutter/material.dart';
import 'package:vgc_cabs/screens/ride_list_screen.dart';
import 'package:vgc_cabs/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VGC Cabs'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('View Rides'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RideListScreen(),
                ),
              );
            },
          ),
          RaisedButton(
            child: Text('View Profile'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}