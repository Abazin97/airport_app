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
import 'package:airportapp/pages/transfer_transit.dart';
import 'package:airportapp/pages/transport_to_from.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

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
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              if(homeScreenNotifier.pageIndex == 7 || homeScreenNotifier.pageIndex == 8){
                final slideIn = Tween<Offset>(
                begin: const Offset(1.0, 0.0), // новый экран появляется справа
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