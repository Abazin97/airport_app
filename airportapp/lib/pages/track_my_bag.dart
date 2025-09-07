import 'package:airportapp/pages/reconnect_tags.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class TrackMyBag extends StatelessWidget {
  TrackMyBag({super.key});
  final Uri _url1 = Uri.parse('https://www.hongkongairport.com/iwov-resources/html/MyTag/en/mytagseries.html');
  final Uri _url2 = Uri.parse('https://hkairportshop.com/eshop_en/mytag-business-style-28red-29-2b566-11rd000-1.html');
  final Uri _url3 = Uri.parse('https://login.hkairportrewards.com/');
  final Uri _url4 = Uri.parse('https://www.hkairportrewards.com/en_US/contact-us');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.close,
            color: Colors.white, 
          )
        ),
        title: Text(
          'Track My Baggage',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )
        ),
        actions: [
          IconButton(
            onPressed: (){

            }, 
            icon: Icon(Icons.more_horiz, 
            color: Colors.white,))
        ],
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReconnectTags()));
        },
        child: Container(
          height: 45,
          margin: const EdgeInsets.only(right: 24, left: 24),
          decoration: BoxDecoration(
            color: Colors.blue[800], 
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black)]),
          child: Center(child: Text('Reconnect Registered Tags', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),)),
        ),
      ),
      body: ListView(
        children: [
          Image.asset('lib/assets/MyTAG_Series.png'),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 25, right: 25, bottom: 40),
            child: Text('MyTAG Series', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('Track your bag and receive notifications of estimated pick-up times, via the My HKG mobile App.\n\nTravel smarter, with MyTAG.', style: TextStyle(fontSize: 18),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, bottom: 25),
            child: GestureDetector(
              onTap: () async {
                await launchUrl(_url1, mode: LaunchMode.externalApplication);},
              child: Text('know More', style: TextStyle(fontSize: 18, decoration: TextDecoration.underline, decorationColor: Colors.blue, color: Colors.blue))
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(80),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Column(
                  children: [
                    Image.asset('lib/assets/mytag.png', fit: BoxFit.contain),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('MyTAG', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('From HK\$90', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(140, 30),
                              textStyle: TextStyle(fontSize: 15),
                              backgroundColor: Colors.yellow,
                            ),
                            onPressed: () async {
                              await launchUrl(_url2, mode: LaunchMode.inAppWebView);
                            },
                            child: Text('Buy now'),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(140, 30),
                              textStyle: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ReconnectTags()));
                            },
                            child: Text('Register'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25),
            child: Text('For HKairport Rewards Member', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('If you registered MyTAG on HKairport Rewards, please login first.', style: TextStyle(fontSize: 18),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 25, right: 25),
            child: Text('Member', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 7),
            child: Divider(
                  color: Colors.grey[300],
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 7),
            child: GestureDetector(
              onTap: () async{
                await launchUrl(_url3, mode: LaunchMode.inAppWebView);
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.link),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text('Login as Member / View Member'),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Divider(
                        color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 7),
            child: GestureDetector(
              onTap: () async{
                await launchUrl(_url4, mode: LaunchMode.externalApplication);
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.link),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text('Member Enquiry'),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Divider(
                        color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60)
        ],
      ),
    );
  }
}