import 'package:airportapp/providers/nav_provider.dart';
import 'package:airportapp/pages/departures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class Arrivals extends StatelessWidget {
  const Arrivals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Arrivals',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Provider.of<NavProvider>(context, listen: false).pageIndex = 7;
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )
        ),
        actions: [
          IconButton(
            onPressed: () async{
              final urlPreview = 'https://www.hongkongairport.com/apps/contentPage?pageId=local_transport_traffic_condition';
              await SharePlus.instance.share(ShareParams(text: 'I would like to share "Traffic Conditions To and From Airport" with you. \n\nClick here for details: $urlPreview', subject: 'I would like to share "Traffic Conditions To and From Airport" with you.'));
            }, 
            icon: Icon(
              Icons.share, 
              color: Colors.white
            )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(children: [
          Departures.pageButton('Immigration', Icons.contact_page_outlined, context, 29),
          Departures.pageButton('HKIA Courtesy Channel', Icons.transfer_within_a_station, context, 20),
          Departures.pageButton('Baggage Reclaim', Icons.luggage_outlined, context, 25),
          Departures.pageButton('Customs and excise', Icons.person_outline, context, 26),
          Departures.pageButton('Meet and Greet', Icons.group_outlined, context, 27),
          Departures.pageButton('Visa & Tourist Information', Icons.info_outline, context, 28),
        ],),
      ),
    );
  }
}