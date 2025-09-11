import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/pages/custom_drawer.dart';
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
            Navigator.pop(context);
            //Provider.of<NavProvider>(context, listen: false).pageIndex = 0;
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
      )
    );
  }
}