import 'package:airportapp/components/auth_layout.dart';
import 'package:airportapp/components/bottom_nav_bar.dart';
import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/info%20pages/about.dart';
import 'package:airportapp/pages/all_events.dart';
import 'package:airportapp/pages/arrivals.dart';
import 'package:airportapp/pages/art_culture.dart';
import 'package:airportapp/pages/contact_us.dart';
import 'package:airportapp/pages/custom_drawer.dart';
import 'package:airportapp/pages/departures.dart';
import 'package:airportapp/pages/flights_page.dart';
import 'package:airportapp/pages/hkia_tips.dart';
import 'package:airportapp/pages/home_page.dart';
import 'package:airportapp/pages/inbox_page.dart';
import 'package:airportapp/pages/my_favourites.dart';
import 'package:airportapp/pages/settings.dart';
import 'package:airportapp/pages/shop_list_page.dart';
import 'package:airportapp/pages/shop_page.dart';
import 'package:airportapp/pages/transfer_transit.dart';
import 'package:airportapp/pages/transport_to_from.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _pages = [
    Builder(builder: (context){
      final drawer = context.watch<NavProvider>();
      return HomePage(isDrawer: drawer.isDrawer);
    }),
    //const HomePage(),// 0
    Builder(builder: (context){
      final nav = context.watch<NavProvider>();
      return FlightsPage(autofocus: nav.autofocus);// 1
    }),
    const ShopPage(),// 2
    const AuthLayout(),// 3
    const InboxPage(),// 4
    const TransportToFrom(),// 5
    const ShopListPage(),// 6
    const CustomDrawer(),// 7
    const Departures(),// 8
    const Arrivals(),// 9
    const TransferTransit(),// 10
    const HkiaTips(),// 11
    const MyFavourites(),// 12
    const ArtCulture(),// 13
    const Settings(),// 14
    const ContactUs(), //15
    const About(),// 16
    const AllEvents()// 17
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, homeScreenNotifier, child){
        return Scaffold(
          bottomNavigationBar: BottomNavBar(),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              if(homeScreenNotifier.pageIndex == 7 || 
                homeScreenNotifier.pageIndex == 8 ||
                homeScreenNotifier.pageIndex == 9 ||
                homeScreenNotifier.pageIndex == 10 ||
                homeScreenNotifier.pageIndex == 11 ||
                homeScreenNotifier.pageIndex == 12 ||
                homeScreenNotifier.pageIndex == 13 ||
                homeScreenNotifier.pageIndex == 14 ||
                homeScreenNotifier.pageIndex == 15 ||
                homeScreenNotifier.pageIndex == 16){
                final slideIn = Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation);

              return SlideTransition(position: slideIn, child: child);
              }else{
                return FadeTransition(opacity: animation, child: child);
              }
            },
            child: _pages[homeScreenNotifier.pageIndex]),
        );
      }
    );
  }
}