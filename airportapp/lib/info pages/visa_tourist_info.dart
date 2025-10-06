import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/pages/departures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class VisaTouristInfo extends StatelessWidget {
  const VisaTouristInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Visa & Tourist Information',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Provider.of<NavProvider>(context, listen: false).pageIndex = 9;
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )
        ),
        actions: [
          IconButton(
            onPressed: () async{
              final urlPreview = 'https://www.hongkongairport.com/apps/contentPage?pageId=guide_departure';
              await SharePlus.instance.share(ShareParams(text: 'I would like to share "Departures" with you. \n\nClick here for details: $urlPreview', subject: 'I would like to share "Departures" with you.'));
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
          Departures.pageButton('Hong Kong Tourism Board Visitor Information Services', Icons.contact_page_outlined, context, 19),
          Departures.pageButton('China Travel Service (HK)', Icons.transfer_within_a_station, context, 20),
          Departures.pageButton('Macau Government Tourist Office', Icons.luggage_outlined, context, 25),
          Departures.pageButton('Hong Kong Hotels Association', Icons.person_outline, context, 26),
          Departures.pageButton('Travel Industry Council', Icons.group_outlined, context, 27),
        ],),
      ),
    );
  }
}