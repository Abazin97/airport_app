import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DepartmentWebsite extends StatelessWidget {
  const DepartmentWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Column(
          children: [
            Text(
              'Traffic Conditions To and',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14
              ),
            ),
            Text(
              'From Airport',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close_outlined,
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
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hong Kong Traffic Conditions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            SizedBox(height: 20),
            RichText(text: TextSpan(
              children: [
                const TextSpan(text: "The Transport Department`s website provides ", style: TextStyle(color: Colors.black, fontSize: 16)),
                TextSpan(text: "road traffic information service.", style: TextStyle(color: Colors.blue[900], decoration: TextDecoration.underline, fontSize: 16),
                recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  final url = Uri.parse('https://www.hkemobility.gov.hk/en/traffic-information/live/cctv');
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }),
                const TextSpan(text: ' Images of traffic conditions are automatically reloaded every two minutes.', style: TextStyle(color: Colors.black, fontSize: 16))
              ]
            ))
          ],
        ),
      ),
    );
  }
}