import 'package:flutter/material.dart';
import 'package:vgc_cabs/screens/home_screen.dart';
import 'package:vgc_cabs/screens/login_screen.dart';
import 'package:vgc_cabs/screens/registration_screen.dart';
import 'package:vgc_cabs/screens/ride_details_screen.dart';
import 'package:vgc_cabs/screens/ride_list_screen.dart';
import 'package:vgc_cabs/screens/profile_screen.dart';
import 'package:vgc_cabs/models/user.dart';
import 'package:vgc_cabs/models/ride.dart';
import 'package:vgc_cabs/services/api_service.dart';
import 'package:vgc_cabs/services/auth_service.dart';
import 'package:vgc_cabs/services/ride_service.dart';
import 'package:vgc_cabs/utils/constants.dart';

void main() {
  runApp(VgcCabsApp());
}

class VgcCabsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VGC Cabs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        RideDetailsScreen.id: (context) => RideDetailsScreen(),
        RideListScreen.id: (context) => RideListScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
    );
  }
}