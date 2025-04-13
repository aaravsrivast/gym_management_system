import 'package:flutter/material.dart';
import '../utils/storage.dart';
import '../screens/login.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  void logout(BuildContext context) async {
    await Storage.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => logout(context),
      icon: const Icon(Icons.logout),
      tooltip: 'Logout',
    );
  }
}