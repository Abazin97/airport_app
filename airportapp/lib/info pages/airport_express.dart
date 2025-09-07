import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AirportExpress extends StatelessWidget {
  const AirportExpress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Airport Express',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
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
            onPressed: ()async {
              final urlPreview = 'https://www.hongkongairport.com/apps/contentPage?pageId=airport_express';
              await SharePlus.instance.share(ShareParams(text: 'I would like to share "Airport Express" with you.\n\nClick here for details: $urlPreview', subject: 'I would like to share "Airport Express" with you.'));
            }, 
            icon: Icon(
              Icons.share, 
              color: Colors.white
            )
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('lib/assets/airport_express.jpg'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: RichText(
                    text:TextSpan(children: [
                      const TextSpan(text: 'The Airport Express takes passengers to Central in just 24 minutes. Quick and comfortable, trains depart at approximately 10 minutes intervals from 05:54 to 00:48 daily. For detailed schedule of the Airport Express, please click ', style: TextStyle(color: Colors.black, fontSize: 16)),
                      TextSpan(text: 'here', style: TextStyle(color: Colors.blue[900], decoration: TextDecoration.underline, fontSize: 16),
                      recognizer: TapGestureRecognizer()
                      ..onTap = ()async{
                        final url = Uri.parse('https://www.mtr.com.hk/en/customer/services/timetable_index.html');
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      }),
                      const TextSpan(text: ' You may also download the "', style: TextStyle(color: Colors.black, fontSize: 16)),
                      TextSpan(text: 'MTR Mobile', style: TextStyle(color: Colors.blue[900], decoration: TextDecoration.underline, fontSize: 16),
                      recognizer: TapGestureRecognizer()
                      ..onTap = ()async{
                        final _url = Uri.parse('https://www.mtr.com.hk/mtrmobile/en/');
                        await launchUrl(_url, mode: LaunchMode.externalApplication);
                      }),
                      const TextSpan(text: '" app to keep track of the real-time update of the train schedules.', style: TextStyle(color: Colors.black, fontSize: 16))
                    ])
                  )
                ),
                Text('Take the Airport Express', style: TextStyle(fontSize: 16)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Travel between the city and the airport in just 24 minutes', style: TextStyle(fontSize: 16)),
                ),
                RichText(text: TextSpan(children: [
                  TextSpan(text: 'Click here to buy tickets now!', style: TextStyle(color: Colors.blue[900], decoration: TextDecoration.underline, fontSize: 16),
                  recognizer: TapGestureRecognizer()
                  ..onTap = ()async{
                    final tickets = Uri.parse('https://www.paydollar.com/b2c2/AELControlServlet?catid=10020&vEngine=A9cZG5hCDeQioK968uQU6t58Nfg%3D&lang=eng');
                    await launchUrl(tickets, mode: LaunchMode.externalApplication);
                  })
                ])),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset('lib/assets/schedule.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: RichText(text: TextSpan(children: [
                    const TextSpan(text: 'The In-Town Check-In service is available at Hong Kong Station and Kowloon Station. Please click ', style: TextStyle(fontSize: 16, color: Colors.black)),
                    TextSpan(text: 'here', style: TextStyle(color: Colors.blue[900], decoration: TextDecoration.underline, fontSize: 16),
                    recognizer: TapGestureRecognizer()
                    ..onTap = ()async{
                      final _url2 = Uri.parse('https://www.mtr.com.hk/en/customer/services/complom_checkin.html');
                      await launchUrl(_url2, mode: LaunchMode.externalApplication);
                    }),
                    TextSpan(text: ' for service details.', style: TextStyle(fontSize: 16, color: Colors.black))
                  ])),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: RichText(text: TextSpan(children: [
                    const TextSpan(text: 'Passengers wishing to visit the Disneyland Resort can change to the Tung Chung Line at Tsing Yi Station, and alight at Sunny Bay Station for the Disneyland Resort Line. Please click ', style: TextStyle(fontSize: 16, color: Colors.black)),
                    TextSpan(text: 'here', style: TextStyle(color: Colors.blue[900], decoration: TextDecoration.underline, fontSize: 16),
                    recognizer: TapGestureRecognizer()
                    ..onTap = ()async{
                      final _url2 = Uri.parse('https://www.mtr.com.hk/en/customer/jp/index.php?sid=47&eid=55');
                      await launchUrl(_url2, mode: LaunchMode.externalApplication);
                    }),
                    TextSpan(text: ' for route details.', style: TextStyle(fontSize: 16, color: Colors.black))
                  ])),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}