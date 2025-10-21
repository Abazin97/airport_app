import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Reminiscence extends StatelessWidget {
  const Reminiscence({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Reminiscence in the Air',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close, color: Colors.white,)),
      ),
      body: ListView(children: [
        Image.asset('lib/assets/reminiscence.jpg', fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                IconButton(onPressed: () {
                  
                },icon: Icon(Icons.bookmark_add_outlined, color: Colors.blue[900],),),
                IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined, color: Colors.blue[900],))
              ],),
              Divider(),
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.map, color: Colors.grey[900],),
                    Text('Between check-in aisles F and G,\nDepartures Level (L7), Terminal 1\n(Non-Restricted Area)',style: TextStyle(color: Colors.grey[900]),),
                    Icon(Icons.location_on_outlined, color: Colors.grey[900],)
                  ]
                ),
              ),
              Divider(),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Icon(Icons.more_time, color: Colors.grey[900],),
                    Text('25 July to 8 November 2025', style: TextStyle(color: Colors.grey[900])),
                  ]
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Text('Gallery', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                child: RichText(text: TextSpan(children: [
                  const TextSpan(text: 'Inspired by the iconic split-flap flight information display at Kai Tak Airport, the exhibition features a series of photographs of Hong Kong International Airport (HKIA) taken by photographer from Hong Kong Reminiscence, alongside archival images of Kai Tak Airport. Using mechanical flipping devices, these images are transformed into a dynamic, pixelated chronicle of the airport`s evolution. This visual language allows visitors to appreciate the beauty of different corners of the airport at a fleeting glance.\n\nUpcycled seating, crafted from metal cabinets collected from aircraft cabins, is available for visitors to rest and relax, transforming old materials into something new.\n\n\nIn collaboration with: Hong Kong Reminiscence | maison V\n\nClick ', style: TextStyle(fontSize: 16, color: Colors.black),),
                  TextSpan(text: 'here', style: TextStyle(color: Colors.blue[900], decoration: TextDecoration.underline, fontSize: 16),
                  recognizer: TapGestureRecognizer()
                  ..onTap = () async{
                    final url = Uri.parse('https://www.hongkongairport.com/iwov-resources/file/relax-fun/art-culture/2025/Ink_and_the_City_Artists_Bio_v2.pdf');
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }),
                  const TextSpan(text: ' to learn more about the collaborating organisation.', style: TextStyle(color: Colors.black, fontSize: 16))]),
                ),
              )
            ],
          ),
        ),
      ],),
    );
  }
}