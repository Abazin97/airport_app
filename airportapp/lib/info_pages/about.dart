import 'package:airportapp/components/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'About My HKG',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
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
              final urlPreview = 'https://www.hongkongairport.com/apps/contentPage?pageId=about_my_hkg';
              await SharePlus.instance.share(ShareParams(text: 'I would like to share "About My HKG" with you. \n\nClick here for details: $urlPreview', subject: 'I would like to share "Traffic Conditions To and From Airport" with you.'));
            }, 
            icon: Icon(
              Icons.share, 
              color: Colors.white
            )
          ),
        ],
      ),
      body: ListView(children: [
        Image.asset('lib/assets/hkia-night.jpg'),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('About this app', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text('Version 0.0.2', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GestureDetector(
                onTap: () => Provider.of<NavProvider>(context, listen: false).pageIndex = 0,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Terms & Conditions'),
                    Icon(Icons.arrow_forward_ios, color: Colors.blue[900],)
                ],),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GestureDetector(
                onTap: ()async{
                  final url = Uri.parse('https://www.hongkongairport.com/en/privacy-policy.page');
                  await launchUrl(url, mode: LaunchMode.inAppWebView);
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Icon(Icons.link_outlined),
                  Padding(
                    padding: const EdgeInsets.only(right: 180),
                    child: Text('Privacy Policy'),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.blue[900],)
                ],),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              child: Text('About HKairport Rewards', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GestureDetector(
                onTap: ()async{
                  final url = Uri.parse('https://hkairportshop.com/eshop_en/terms-condition');
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Icon(Icons.link_outlined),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 80, left: 10),
                      child: Text('Terms and Conditions of HKairport Rewards'),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.blue[900],)
                ],),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GestureDetector(
                onTap: ()async{
                  final url = Uri.parse('https://www.hongkongairport.com/en/privacy-policy.page');
                  await launchUrl(url, mode: LaunchMode.inAppWebView);
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Icon(Icons.link_outlined),
                  Padding(
                    padding: const EdgeInsets.only(right: 180),
                    child: Text('Privacy Policy'),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.blue[900],)
                ],),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              child: Text('About Baggage Arrival Notice Service', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GestureDetector(
                onTap: () => Provider.of<NavProvider>(context, listen: false).pageIndex = 0,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Terms & Conditions'),
                    Icon(Icons.arrow_forward_ios, color: Colors.blue[900],)
                ],),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GestureDetector(
                onTap: () => Provider.of<NavProvider>(context, listen: false).pageIndex = 0,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text('Terms & Conditions for the Use of MyTAG / MyTAG Pro'),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.blue[900],)
                ],),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GestureDetector(
                onTap: () => Provider.of<NavProvider>(context, listen: false).pageIndex = 0,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Personal Information Collection Statement'),
                    Icon(Icons.arrow_forward_ios, color: Colors.blue[900],)
                ],),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 10),
              child: Text('© Airport Authority Hong Kong.'),
            ),
            Text('ReMade with ❤️ by Abazin97'),
            Text('Whole project is free-to-use on any purpose, pull-requests with fixes are welcome, raw source code available on GitHub.'),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 70),
              child: Text('All Rights Reserved.'),
            )
          ],),
        )
      ],),
    );
  }
}