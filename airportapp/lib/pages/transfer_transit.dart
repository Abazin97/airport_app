import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/pages/departures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class TransferTransit extends StatelessWidget {
  const TransferTransit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Transfer / Transit',
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
              final urlPreview = 'https://www.hongkongairport.com/apps/contentPage?pageId=guide_transit';
              await SharePlus.instance.share(ShareParams(text: 'I would like to share "Transfer / Transit" with you. \n\nClick here for details: $urlPreview', subject: 'I would like to share "Transfer / Transit" with you.'));
            }, 
            icon: Icon(
              Icons.share, 
              color: Colors.white
            )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Departures.pageButton('Procedures', Icons.connecting_airports, context),
        ],),
      ),
    );
  }
}