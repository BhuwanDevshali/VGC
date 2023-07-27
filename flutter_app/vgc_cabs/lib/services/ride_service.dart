import 'package:flutter/material.dart';
import 'package:vgc_cabs/models/ride.dart';
import 'package:vgc_cabs/services/api_service.dart';

class RideService {
  final ApiService _apiService;

  RideService(this._apiService);

  Future<List<Ride>> getRides() async {
    // Make API call to fetch rides
    var response = await _apiService.get('/rides');
    if (response.statusCode == 200) {
      // Parse the response and return a list of rides
      List<dynamic> data = response.data;
      List<Ride> rides = data.map((json) => Ride.fromJson(json)).toList();
      return rides;
    } else {
      throw Exception('Failed to get rides');
    }
  }

  Future<Ride> getRideDetails(String rideId) async {
    // Make API call to fetch ride details
    var response = await _apiService.get('/rides/$rideId');
    if (response.statusCode == 200) {
      // Parse the response and return the ride details
      return Ride.fromJson(response.data);
    } else {
      throw Exception('Failed to get ride details');
    }
  }

  Future<Ride> createRide(Ride ride) async {
    // Make API call to create a new ride
    var response = await _apiService.post('/rides', data: ride.toJson());
    if (response.statusCode == 201) {
      // Parse the response and return the created ride
      return Ride.fromJson(response.data);
    } else {
      throw Exception('Failed to create ride');
    }
  }

  Future<void> updateRide(String rideId, Ride ride) async {
    // Make API call to update an existing ride
    var response = await _apiService.put('/rides/$rideId', data: ride.toJson());
    if (response.statusCode != 200) {
      throw Exception('Failed to update ride');
    }
  }

  Future<void> deleteRide(String rideId) async {
    // Make API call to delete a ride
    var response = await _apiService.delete('/rides/$rideId');
    if (response.statusCode != 204) {
      throw Exception('Failed to delete ride');
    }
  }
}