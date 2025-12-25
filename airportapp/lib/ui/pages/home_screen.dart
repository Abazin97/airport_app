import 'package:airportapp/ui/layout/auth_layout.dart';
import 'package:airportapp/components/bottom_nav_bar.dart';
import 'package:airportapp/providers/auth_notifier.dart';
import 'package:airportapp/providers/nav_provider.dart';
import 'package:airportapp/ui/info_pages/about.dart';
import 'package:airportapp/ui/info_pages/airport_security.dart';
import 'package:airportapp/ui/info_pages/baggage_reclaim.dart';
import 'package:airportapp/ui/info_pages/baggage_regulations.dart';
import 'package:airportapp/ui/info_pages/checkin_departures.dart';
import 'package:airportapp/ui/info_pages/courtesy_channel.dart';
import 'package:airportapp/ui/info_pages/customs_excise.dart';
import 'package:airportapp/ui/info_pages/immigration1.dart';
import 'package:airportapp/ui/info_pages/immigration2.dart';
import 'package:airportapp/ui/info_pages/meet_greet.dart';
import 'package:airportapp/ui/info_pages/tips1.dart';
import 'package:airportapp/ui/info_pages/tips2.dart';
import 'package:airportapp/ui/info_pages/visa_tourist_info.dart';
import 'package:airportapp/ui/pages/all_events.dart';
import 'package:airportapp/ui/pages/arrivals.dart';
import 'package:airportapp/ui/pages/art_culture.dart';
import 'package:airportapp/ui/pages/contact_us.dart';
import 'package:airportapp/ui/pages/custom_drawer.dart';
import 'package:airportapp/ui/pages/departures.dart';
import 'package:airportapp/ui/pages/flights_page.dart';
import 'package:airportapp/ui/pages/hkia_tips.dart';
import 'package:airportapp/ui/pages/home_page.dart';
import 'package:airportapp/ui/pages/inbox_page.dart';
import 'package:airportapp/ui/pages/my_favourites.dart';
import 'package:airportapp/ui/pages/settings.dart';
import 'package:airportapp/ui/pages/shop_list_page.dart';
import 'package:airportapp/ui/pages/shop_page.dart';
import 'package:airportapp/ui/info_pages/transfer_transit.dart';
import 'package:airportapp/ui/pages/transport_to_from.dart';
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
    Builder(builder:(context){
      final auth = context.watch<AuthNotifier?>();
      return AuthLayout(authNotifier: auth);
    }),// 3
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
    const AllEvents(),// 17
    const CheckinDepartures(),// 18
    const Immigration1(),// 19
    const CourtesyChannel(),// 20
    const BaggageRegulations(),// 21
    const AirportSecurity(),// 22
    const Tips1(),// 23
    const Tips2(),// 24
    const BaggageReclaim(),// 25
    const CustomsExcise(),// 26
    const MeetGreet(),// 27
    const VisaTouristInfo(),// 28
    const Immigration2(),// 29
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
                homeScreenNotifier.pageIndex == 16 ||
                homeScreenNotifier.pageIndex == 18 ||
                homeScreenNotifier.pageIndex == 19 ||
                homeScreenNotifier.pageIndex == 20 ||
                homeScreenNotifier.pageIndex == 21 ||
                homeScreenNotifier.pageIndex == 22 ||
                homeScreenNotifier.pageIndex == 23 ||
                homeScreenNotifier.pageIndex == 24 ||
                homeScreenNotifier.pageIndex == 25 ||
                homeScreenNotifier.pageIndex == 26 ||
                homeScreenNotifier.pageIndex == 27 ||
                homeScreenNotifier.pageIndex == 28 ||
                homeScreenNotifier.pageIndex == 29){
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