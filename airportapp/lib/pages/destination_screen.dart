import 'package:flutter/material.dart';

class DestinationScreen extends StatelessWidget {
  final String title;
  const DestinationScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
    );
  }
}