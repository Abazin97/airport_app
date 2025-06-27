import 'package:airportapp/components/bottom_nav_bar.dart';
import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/pages/flights_page.dart';
import 'package:airportapp/pages/home_page.dart';
import 'package:airportapp/pages/me_page.dart';
import 'package:airportapp/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _pages = [
    const HomePage(),
    const FlightsPage(),
    const ShopPage(),
    const MePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, homeScreenNotifier, child){
        return Scaffold(
          bottomNavigationBar: BottomNavBar(),
          body: _pages[homeScreenNotifier.pageIndex],
        );
      }
    );
  }
}