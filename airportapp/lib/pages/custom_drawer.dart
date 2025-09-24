import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/pages/track_my_bag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      Provider.of<NavProvider>(context, listen: false).pageIndex = 0;
                      //Navigator.pop(context);
                      //context.read<NavProvider>().setDrawer();
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
                      pageLink(context, 'Departures', Icons.flight_takeoff,index: 8),
                      SizedBox(height: 30),
                      pageLink(context, 'Arrivals', Icons.flight_land_outlined,index: 9),
                      SizedBox(height: 30),
                      pageLink(context, 'Transfer / Transit', Icons.transfer_within_a_station,index: 10),
                      SizedBox(height: 30),
                      pageLink(context, 'Flight Token', Icons.sensor_occupied_outlined, link: 'https://www.hongkongairport.com/en/passenger-guide/flight-token.page'),
                      SizedBox(height: 30),
                      pageLink(context, 'HKIA Tips', Icons.upcoming_outlined,index: 11),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 10),
                        child: Text('Explore Airport Services', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      Divider(),
                      pageLink(context, 'My Favourites', Icons.bookmarks_outlined, index: 12),
                      SizedBox(height: 30),
                      pageLink(context, 'Art & Culture', Icons.brush_outlined, index: 13),
                      SizedBox(height: 30),
                      pageLink(context, 'Transport To & From Airport', Icons.airport_shuttle_outlined, index: 5),
                      SizedBox(height: 30),
                      pageLink(context, 'Parking', Icons.local_parking_outlined, index: 5),
                      SizedBox(height: 30),
                      pageLink(context, 'Valet Parking', Icons.local_parking_outlined, index: 5),
                      SizedBox(height: 30),
                      pageLink(context, 'Mainland & Macao Connection', Icons.directions_bus_outlined, index: 5),
                      SizedBox(height: 30),
                      pageLink(context, 'Stay Connected @ HKIA', Icons.wifi_outlined, ),
                      SizedBox(height: 30),
                      pageLink(context, 'MyTAG and Baggage Arrival Notice', Icons.bookmark_outline, link: 'page'),
                      SizedBox(height: 20),
                      Divider(),
                      SizedBox(height: 40),
                      Text('About My HKG', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Divider(),
                      SizedBox(height: 20),
                      pageLink(context, 'Setting', Icons.settings_outlined, index: 14),
                      SizedBox(height: 30),
                      pageLink(context, 'Contact Us', Icons.mail_outline, index: 15),
                      SizedBox(height: 30),
                      pageLink(context, 'About My HKG', Icons.info_outline, index: 16),
                      SizedBox(height: 60),
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

  Widget pageLink(BuildContext context, String name, IconData icon,{int? index, String? link}){
    return GestureDetector(
      onTap: () async{
        if (link != null){
          if(link == 'page'){
            Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (context) => TrackMyBag()));
          }else{
            final _url = Uri.parse(link);
            await launchUrl(_url, mode: LaunchMode.inAppWebView);
          }
        }else if(index != null){
          Provider.of<NavProvider>(context, listen: false).pageIndex = index;
        }
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
