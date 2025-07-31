import 'package:flutter/material.dart';

class ApploadingPage extends StatelessWidget {
  const ApploadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}