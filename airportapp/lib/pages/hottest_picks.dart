import 'package:airportapp/components/bottom_nav_bar.dart';
import 'package:airportapp/providers/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HottestPicks extends StatelessWidget {
  const HottestPicks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.read<NavProvider>().pageIndex = 0, 
        icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: Text('Hottest picks at HKIA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
      ),
      body: ListView(

      ),
    );
  }
}