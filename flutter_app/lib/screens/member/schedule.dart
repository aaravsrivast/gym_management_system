import 'package:flutter/material.dart';

class MemberSchedulePage extends StatelessWidget {
  const MemberSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Schedule')),
      body: const Center(
        child: Text('Your weekly/monthly schedule will appear here.'),
      ),
    );
  }
}