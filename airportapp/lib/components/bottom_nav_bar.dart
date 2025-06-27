import 'package:airportapp/components/bottom_nav_wid.dart';
import 'package:airportapp/components/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, homeScreenNotifier, child) {
        final currentIndex = homeScreenNotifier.pageIndex;
        return Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavWid(
                  text: 'HOME',
                  index: 0,
                  icon: Icons.home, 
                  active: currentIndex == 0,
                ),
                BottomNavWid(
                  text: 'FLIGHTS',
                  index: 1,
                  icon: Icons.flight_outlined, 
                  active: currentIndex == 1,
                ),
                BottomNavWid(
                  text: 'SHOP & DINE',
                  index: 2,
                  icon: Icons.shopping_bag_outlined, 
                  active: currentIndex == 2,
                ),
                BottomNavWid(
                  text: 'ME',
                  index: 3,
                  icon: Icons.person_2_outlined, 
                  active: currentIndex == 3,
                ),
              ],
            ),
        );
      },
    );
  }
}