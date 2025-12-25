import 'package:airportapp/ui/pages/beauty_you.dart';
import 'package:airportapp/ui/pages/mcdonalds.dart';
import 'package:airportapp/ui/pages/men_wah_bing_teng.dart';
import 'package:airportapp/ui/pages/seven_eleven.dart';
import 'package:airportapp/ui/pages/starbucks.dart';
import 'package:flutter/cupertino.dart';

class StaticTileItem {
  StaticTileItem({
    required this.name,
    required this.description,
    required this.image,
    required this.screen,
  });

  final String name;
  final String description;
  final String image;
  final Widget screen;

  static List<StaticTileItem> getTileList(){
    return [
      StaticTileItem(name: 'McDonald`s® & McCafé®', description: 'Open now • 00:00 - 24:00 • \nTerminal 1', image: 'lib/assets/mcdonalds-shop-front.jpg', screen: Mcdonalds()),
      StaticTileItem(name: 'Beauty&You by The Shilla Duty Free', description: '6 stores', image: 'lib/assets/beauty.jpg', screen: BeautyAndYou()),
      StaticTileItem(name: 'STARBUCKS', description: '5 stores', image: 'lib/assets/starbucks-shop-front.jpg', screen: Starbucks()),
      StaticTileItem(name: 'Men Wah Bing Teng', description: 'Open now • 00:00 - 24:00 • Terminal 1', image: 'lib/assets/men_wah_bing_teng-shop-front.jpg', screen: MenWahBingTeng()),
      StaticTileItem(name: '7-ELEVEN', description: '4 stores', image: 'lib/assets/seven-eleven-shop-front-photo.jpg', screen: SevenEleven())
    ];
  }
}