import 'package:airportapp/pages/track_my_bag.dart';
import 'package:airportapp/pages/transport_to_from.dart';
import 'package:flutter/material.dart';
class CellItem {
  CellItem({
    required this.name,
    required this.image,
    this.screen,
    this.link,
    this.index
  });

  final String name;
  final String image;
  final Widget? screen;
  final String? link;
  final int? index;

  static List<CellItem> getCellList() {
    return [
      CellItem(name: 'Service\nBooking', image: 'lib/assets/cell1.png', link: 'https://www.hkairportbooking.com'),
      CellItem(name: 'Valet Parking', image: 'lib/assets/cell2.png', screen: TransportToFrom(), index: 5),
      CellItem(name: 'Car park', image: 'lib/assets/cell3.png', screen: TransportToFrom()),
      CellItem(name: 'My Tag', image: 'lib/assets/cell4.png', screen: TrackMyBag()),
      CellItem(name: 'HKairport\nShop', image: 'lib/assets/cell5.png', link: 'https://hkairport.com'),
      CellItem(name: 'Food Pre\nOrdering', image: 'lib/assets/cell6.png', link: 'https://mobile.hongkongairportfood.com'),
    ];
  }
}