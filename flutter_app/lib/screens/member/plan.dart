import 'package:flutter/material.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Plan')),
      body: const Center(
        child: Text('This page displays the member\'s current active plan.'),
      ),
    );
  }
}