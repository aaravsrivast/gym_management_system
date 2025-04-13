import 'package:flutter/material.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gym Locations')),
      body: const Center(
        child: Text('This page will list all gym branches available.'),
      ),
    );
  }
}