import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtInMotion extends StatelessWidget {
  const ArtInMotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Art in Motion',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close, color: Colors.white,)),
      ),
      body: ListView(children: [
        Image.asset('lib/assets/motion.jpg', fit: BoxFit.cover),
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
                    Text('Arrivals Hall A, Arrivals Level(L5),\nTerminal 1\n(Non-Restricted Area)',style: TextStyle(color: Colors.grey[900]),),
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
                  const TextSpan(text: 'In collaboration with local association and arts organisations, Hong Kong International Airport explores the city’s culture and history while showcasing the beauty of various landscapes around the world from different perspectives.\n\nThis exhibition features a collection of four videos that not only celebrates the artistic talents of intellectually disabled artists from Hong Chi Association, but also allow viewers to capture the historical moments of Kai Tak Airport through a selection of analogue photographs displayed on a giant LED screen. In an animation created by local artist, the airport’s moving walkways are transformed into a flowing canvas that showcases vibrant cityscapes and travellers from around the world, inviting visitors to embark on a journey of Art in Motion.\n\n\nIn collaboration with Hong Chi Association, M+ and MobArt Gallery\n\nParticipating artists: Greg Girard | Isaac Spellman\n\nClick ', style: TextStyle(fontSize: 16, color: Colors.black),),
                  TextSpan(text: 'here', style: TextStyle(color: Colors.blue[900], decoration: TextDecoration.underline, fontSize: 16),
                  recognizer: TapGestureRecognizer()
                  ..onTap = () async{
                    final url = Uri.parse('https://www.hongkongairport.com/iwov-resources/file/relax-fun/art-culture/2025/Art_in_Motion_Artists_Bio.pdf');
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }),
                  const TextSpan(text: ' to learn more about the artworks, collaborating organisation and artist.', style: TextStyle(color: Colors.black, fontSize: 16))]),
                ),
              )
            ],
          ),
        ),
      ],),
    );
  }
}