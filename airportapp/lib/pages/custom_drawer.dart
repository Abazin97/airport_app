import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/pages/departures.dart';
import 'package:airportapp/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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
          //appbar-like header
          Container(
            height: 90,
            padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
            color: Colors.blue[800],
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'More',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Passenger Guide', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Divider(),
                      SizedBox(height: 20),
                      PageLink(context, 'Departures', Icons.flight_takeoff, 7, Departures()),
                      SizedBox(height: 30),
                      // PageLink(name: 'Arrivals', icon: Icons.flight_land_outlined,),
                      // SizedBox(height: 30),
                      // PageLink(name: 'Flight Token', icon: Icons.sensor_occupied_outlined,),
                      // SizedBox(height: 30),
                      // PageLink(name: 'HKIA Tips', icon: Icons.upcoming_outlined,),
                      // Divider(),
                      // SizedBox(height: 40),
                      // Text('Explore Airport Services', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      // Divider(),
                      // SizedBox(height: 20),
                      // PageLink(name: 'My Favourites', icon: Icons.bookmarks_outlined,),
                      // SizedBox(height: 30),
                      // PageLink(name: 'Art & Culture', icon: Icons.brush_outlined,),
                      // SizedBox(height: 30),
                      // PageLink(name: 'Transport To & From Airport', icon: Icons.airport_shuttle_outlined,),
                      // SizedBox(height: 30),
                      // PageLink(name: 'Parking', icon: Icons.local_parking_outlined,),
                      // SizedBox(height: 30),
                      // PageLink(name: 'Valet Parking', icon: Icons.local_parking_outlined,),
                      // SizedBox(height: 30),
                      // PageLink(name: 'Mainland & Macao Connection', icon: Icons.directions_bus_outlined,),
                      // SizedBox(height: 30),
                      // PageLink(name: 'Stay Connected @ HKIA', icon: Icons.wifi_outlined,),
                      // SizedBox(height: 30),
                      // PageLink(name: 'MyTAG and Baggage Arrival Notice', icon: Icons.bookmark_outline,),
                      // SizedBox(height: 20),
                      // Divider(),
                      // SizedBox(height: 40),
                      // Text('About My HKG', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      // Divider(),
                      // SizedBox(height: 20),
                      // PageLink(name: 'Setting', icon: Icons.settings_outlined,),
                      // SizedBox(height: 30),
                      // PageLink(name: 'Contact Us', icon: Icons.mail_outline,),
                      // SizedBox(height: 30),
                      // PageLink(name: 'About My HKG', icon: Icons.info_outline,),
                      // SizedBox(height: 60),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget PageLink(BuildContext context, String name, IconData icon, int index, Widget screen){
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(RightSlideRoute(page: const Departures()));
        //context.read<NavProvider>().pageIndex = 7;
      },
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[800]),
          SizedBox(width: 20),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class RightSlideRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  RightSlideRoute({required this.page})
    : super(
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // справа
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
}


