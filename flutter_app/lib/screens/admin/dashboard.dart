import 'package:flutter/material.dart';
import '../../utils/storage.dart';
import '../../screens/login.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  void logout(BuildContext context) async {
    await Storage.clear();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(
        child: Text('Welcome to Admin Dashboard!'),
      ),
    );
  }
}