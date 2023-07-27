import 'package:flutter/material.dart';

void main() {
  runApp(VGCCabsApp());
}

class VGCCabsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VGC Cabs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VGC Cabs'),
      ),
      body: Center(
        child: Text(
          'Welcome to VGC Cabs!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}