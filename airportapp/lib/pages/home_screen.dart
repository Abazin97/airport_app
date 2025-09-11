import 'package:airportapp/components/auth_layout.dart';
import 'package:airportapp/components/bottom_nav_bar.dart';
import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/pages/arrivals.dart';
import 'package:airportapp/pages/custom_drawer.dart';
import 'package:airportapp/pages/departures.dart';
import 'package:airportapp/pages/flights_page.dart';
import 'package:airportapp/pages/home_page.dart';
import 'package:airportapp/pages/inbox_page.dart';
import 'package:airportapp/pages/shop_list_page.dart';
import 'package:airportapp/pages/shop_page.dart';
import 'package:airportapp/pages/transport_to_from.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _pages = [
    const HomePage(),// 0
    Builder(builder: (context){
      final nav = context.watch<NavProvider>();
      return FlightsPage(autofocus: nav.autofocus);// 1
    }),
    const ShopPage(),// 2
    const AuthLayout(),// 3
    const InboxPage(),// 4
    const TransportToFrom(),// 5
    const ShopListPage(),// 6
    const Departures(),// 7
    const Arrivals(),// 8
  ];

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, homeScreenNotifier, child){
        return Scaffold(
          //key: _scaffoldKey,
          //endDrawer: CustomDrawer(),
          bottomNavigationBar: BottomNavBar(),
          body: _pages[homeScreenNotifier.pageIndex],
        );
      }
    );
  }
}