import 'package:flutter/material.dart';

class MemberProfilePage extends StatelessWidget {
  const MemberProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: const Center(
        child: Text('This page allows the member to view/edit their profile.'),
      ),
    );
  }
}