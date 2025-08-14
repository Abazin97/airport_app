import 'package:flutter/material.dart';

class DeparturesDrawer extends StatelessWidget {
  const DeparturesDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      width: 550,
      backgroundColor: Colors.white,
      elevation: 0,
      child: Column(
        children: [
          Text('data')
        ],
      )
    );
  }
}