import 'package:flutter/material.dart';

class MyMembersPage extends StatelessWidget {
  const MyMembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Members')),
      body: const Center(
        child: Text('List of all members assigned to this trainer.'),
      ),
    );
  }
}