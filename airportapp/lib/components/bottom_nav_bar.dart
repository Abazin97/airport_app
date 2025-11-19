import 'dart:async';
import 'package:airportapp/components/bottom_nav_wid.dart';
import 'package:airportapp/providers/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool isConnectedInternet = true;

  StreamSubscription? _internetConnectionStreamSubscription;

  @override
  void initState() {
    super.initState();
    _internetConnectionStreamSubscription = InternetConnectionChecker.instance.onStatusChange.listen(
      (InternetConnectionStatus status){
        switch (status){
          case InternetConnectionStatus.connected:
            setState(() {
              isConnectedInternet = true;
            });
            break;
          case InternetConnectionStatus.disconnected:
            setState(() {
              isConnectedInternet = false;
            });
            break;
          default:
            setState(() {
              isConnectedInternet = false;
            });
            break;
        }
      }
    );
  }

  @override
  void dispose(){
    super.dispose();
    _internetConnectionStreamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, homeScreenNotifier, child) {
        final currentIndex = homeScreenNotifier.pageIndex;
        return Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isConnectedInternet) 
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
      },
    );
  }
}