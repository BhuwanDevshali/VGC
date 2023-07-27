import 'package:flutter/material.dart';
import 'package:vgc_cabs/models/user.dart';
import 'package:vgc_cabs/services/api_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User _user;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    setState(() {
      _isLoading = true;
    });

    try {
      _user = await ApiService.getUserDetails();
    } catch (error) {
      // Handle error
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _user != null
              ? Column(
                  children: [
                    Text('Name: ${_user.name}'),
                    Text('Email: ${_user.email}'),
                    Text('Phone: ${_user.phone}'),
                  ],
                )
              : Center(
                  child: Text('Failed to fetch user details.'),
                ),
    );
  }
}