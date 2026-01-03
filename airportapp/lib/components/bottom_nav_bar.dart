import 'package:airportapp/components/bottom_nav_wid.dart';
import 'package:airportapp/providers/bloc/network_bloc.dart';
import 'package:airportapp/providers/bloc/network_state.dart';
import 'package:airportapp/providers/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, homeScreenNotifier, child) {
        final currentIndex = homeScreenNotifier.pageIndex;
        return BlocBuilder<NetworkBloc, NetworkState>(
          builder: (context, state) {
            return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!state.isConnected) 
                      Container(height: 60, color: Colors.red,child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'No internet connection available. Please check your connection settings and try again.', style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BottomNavWid(
                            text: 'HOME',
                            index: 0,
                            icon: Icons.home, 
                            active: currentIndex == 0 || 
                            currentIndex == 4 || 
                            currentIndex == 5 || 
                            currentIndex == 7 ||
                            currentIndex == 8 ||
                            currentIndex == 9 ||
                            currentIndex == 10 ||
                            currentIndex == 11 ||
                            currentIndex == 12 ||
                            currentIndex == 13 ||
                            currentIndex == 14 ||
                            currentIndex == 15 ||
                            currentIndex == 16 ||
                            currentIndex == 17        
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
                            active: currentIndex == 2 || currentIndex == 6,
                          ),
                          BottomNavWid(
                            text: 'ME',
                            index: 3,
                            icon: Icons.person_2_outlined, 
                            active: currentIndex == 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            );
          }
        );
      },
    );
  }
}