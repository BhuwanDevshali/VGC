import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vgc_cabs/models/user.dart';
import 'package:vgc_cabs/models/ride.dart';
import 'package:vgc_cabs/utils/constants.dart';

class ApiService {
  Future<User> loginUser(String email, String password) async {
    final response = await http.post(
      '${Constants.apiUrl}/login',
      body: json.encode({
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<User> registerUser(String name, String email, String password) async {
    final response = await http.post(
      '${Constants.apiUrl}/register',
      body: json.encode({
        'name': name,
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<List<Ride>> getRideList() async {
    final response = await http.get('${Constants.apiUrl}/rides');

    if (response.statusCode == 200) {
      List<dynamic> rideData = json.decode(response.body);
      return rideData.map((ride) => Ride.fromJson(ride)).toList();
    } else {
      throw Exception('Failed to get ride list');
    }
  }

  Future<Ride> getRideDetails(String rideId) async {
    final response = await http.get('${Constants.apiUrl}/rides/$rideId');

    if (response.statusCode == 200) {
      return Ride.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get ride details');
    }
  }

  Future<Ride> createRide(Ride ride) async {
    final response = await http.post(
      '${Constants.apiUrl}/rides',
      body: json.encode(ride.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return Ride.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create ride');
    }
  }

  Future<Ride> updateRide(String rideId, Ride ride) async {
    final response = await http.put(
      '${Constants.apiUrl}/rides/$rideId',
      body: json.encode(ride.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return Ride.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update ride');
    }
  }

  Future<void> deleteRide(String rideId) async {
    final response = await http.delete('${Constants.apiUrl}/rides/$rideId');

    if (response.statusCode != 204) {
      throw Exception('Failed to delete ride');
    }
  }
}