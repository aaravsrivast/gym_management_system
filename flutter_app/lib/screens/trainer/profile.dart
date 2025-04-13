import 'package:flutter/material.dart';

class TrainerProfilePage extends StatelessWidget {
  const TrainerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: const Center(
        child: Text('This page allows trainers to update their profile.'),
      ),
    );
  }
}