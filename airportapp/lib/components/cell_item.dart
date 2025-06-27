import 'package:airportapp/pages/track_my_bag.dart';
import 'package:airportapp/pages/transport_to_from.dart';
import 'package:flutter/material.dart';
class CellItem {
  CellItem({
    required this.name,
    required this.image,
    this.screen,
    this.link
  });

  final String name;
  final String image;
  final Widget? screen;
  final String? link;

  static List<CellItem> getCellList() {
    return [
      CellItem(name: 'Service\nBooking', image: 'lib/images/', link: 'https://www.hkairportbooking.com'),
      CellItem(name: 'Valet Parking', image: 'lib/images/', screen: TransportToFrom()),
      CellItem(name: 'Car park', image: 'lib/images/', screen: TransportToFrom()),
      CellItem(name: 'My Tag', image: 'lib/images/', screen: TrackMyBag()),
      CellItem(name: 'HKairport\nShop', image: 'lib/images/', link: 'https://hkairport.com'),
      CellItem(name: 'Food Pre\nOrdering', image: 'lib/images/', link: 'https://mobile.hongkongairportfood.com'),
    ];
  }
}