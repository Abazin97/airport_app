import 'package:airportapp/components/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class Departures extends StatelessWidget {
  const Departures({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Departures',
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
        padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
        child: Column(children: [
          pageButton('Check In / Departures', Icons.group_outlined, context),
          pageButton('Immigration', Icons.contact_page_outlined, context),
          pageButton('HKIA Courtesy Channel', Icons.transfer_within_a_station, context),
          pageButton('Baggage Regulations', Icons.luggage_outlined, context),
          pageButton('Airport Security', Icons.security, context),
          pageButton('Tips for Passengers to Gate 201-230 (With APM operation)', Icons.route_outlined, context),
          pageButton('Tips for Passengers to Gate 201-230 (During non-APM operation)', Icons.route_outlined, context)
        ],),
      ),
    );
  }

  Widget pageButton(String text, IconData icon, BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => Provider.of<NavProvider>(context, listen: false).pageIndex = 7,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Icon(icon, color: Colors.blue[900],),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}