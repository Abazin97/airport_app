import 'package:airportapp/providers/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class Immigration2 extends StatelessWidget {
  const Immigration2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Immigration',
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
    );
  }
}