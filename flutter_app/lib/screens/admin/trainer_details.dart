import 'package:flutter/material.dart';

class TrainerDetailsPage extends StatelessWidget {
  const TrainerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trainer Details')),
      body: const Center(
        child: Text('This page will allow Admin to manage trainers.'),
      ),
    );
  }
}