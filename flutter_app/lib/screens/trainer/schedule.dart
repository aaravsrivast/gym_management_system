import 'package:flutter/material.dart';

class TrainerSchedulePage extends StatelessWidget {
  const TrainerSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trainer Schedule')),
      body: const Center(
        child: Text('View and manage the schedule for assigned members.'),
      ),
    );
  }
}