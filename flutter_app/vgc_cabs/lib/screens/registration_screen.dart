import 'package:flutter/material.dart';
import 'package:vgc_cabs/services/api_service.dart';
import 'package:vgc_cabs/services/auth_service.dart';
import 'package:vgc_cabs/utils/constants.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool _isLoading = false;

  void _register() async {
    setState(() {
      _isLoading = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _nameController.text;

    // Perform registration logic using the API service
    bool success = await ApiService.registerUser(email, password, name);

    setState(() {
      _isLoading = false;
    });

    if (success) {
      // Registration successful, navigate to the home screen
      Navigator.pushReplacementNamed(context, Constants.homeScreenRoute);
    } else {
      // Registration failed, show an error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Failed'),
            content: Text('Please try again.'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            RaisedButton(
              child: _isLoading ? CircularProgressIndicator() : Text('Register'),
              onPressed: _isLoading ? null : _register,
            ),
          ],
        ),
      ),
    );
  }
}