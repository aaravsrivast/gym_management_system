import 'package:flutter/material.dart';

class AssignerPage extends StatelessWidget {
  const AssignerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Assign Member to Trainer')),
      body: const Center(
        child: Text('This page will allow Admin to assign members to trainers.'),
      ),
    );
  }
}