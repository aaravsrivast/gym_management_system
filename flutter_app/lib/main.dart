import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'utils/storage.dart';
import 'screens/admin/dashboard.dart';
import 'screens/trainer/dashboard.dart';
import 'screens/member/dashboard.dart';

void main() {
  runApp(const GymApp());
}

class GymApp extends StatelessWidget {
  const GymApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _checking = true;
  Widget _redirectPage = const LoginScreen();

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    final token = await Storage.read("access_token");
    final role = await Storage.read("role");

    if (token != null && role != null) {
      if (role == "admin") {
        _redirectPage = const AdminDashboard();
      } else if (role == "trainer") {
        _redirectPage = const TrainerDashboard();
      } else {
        _redirectPage = const MemberDashboard();
      }
    }

    setState(() => _checking = false);
  }

  @override
  Widget build(BuildContext context) {
    return _checking
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : _redirectPage;
  }
}