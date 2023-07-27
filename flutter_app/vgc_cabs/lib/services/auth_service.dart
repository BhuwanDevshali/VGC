import 'package:flutter/material.dart';
import 'package:vgc_cabs/utils/constants.dart';
import 'package:vgc_cabs/services/api_service.dart';

class AuthService {
  final ApiService _apiService;

  AuthService(this._apiService);

  Future<bool> login(String email, String password) async {
    try {
      // Make API call to authenticate user
      final response = await _apiService.post('/login', {
        'email': email,
        'password': password,
      });

      // Check if login was successful
      if (response.statusCode == 200) {
        // TODO: Implement logic to handle successful login
        return true;
      } else {
        // TODO: Implement logic to handle failed login
        return false;
      }
    } catch (e) {
      // TODO: Implement error handling
      return false;
    }
  }

  Future<bool> register(String email, String password, String name) async {
    try {
      // Make API call to register user
      final response = await _apiService.post('/register', {
        'email': email,
        'password': password,
        'name': name,
      });

      // Check if registration was successful
      if (response.statusCode == 200) {
        // TODO: Implement logic to handle successful registration
        return true;
      } else {
        // TODO: Implement logic to handle failed registration
        return false;
      }
    } catch (e) {
      // TODO: Implement error handling
      return false;
    }
  }
}