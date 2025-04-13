import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Offers')),
      body: const Center(
        child: Text('This page shows the latest gym offers and discounts.'),
      ),
    );
  }
}