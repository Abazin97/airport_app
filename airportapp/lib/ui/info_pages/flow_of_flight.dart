import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FlowOfFlight extends StatelessWidget {
  const FlowOfFlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'The Flow of Flights',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close, color: Colors.white,)),
      ),
      body: ListView(children: [
        Image.asset('lib/assets/flights.jpg', fit: BoxFit.cover),
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
                    Text('Near Bay no.24-29, Coach Hall,\nTerminal 2\n(Non-Restricted Area)',style: TextStyle(color: Colors.grey[900]),),
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
                    Text('23 September to 8 November 2025', style: TextStyle(color: Colors.grey[900])),
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
                  const TextSpan(text: '“Aeroplane Chess”, an iconic board game in Hong Kong, is a cherished part of our childhood memories and shapes our earliest impressions of "flight". The airport serves as a hub for countless travellers embarking on their journeys – some are ready to depart, while others are returning home. Here, their paths may intersect or diverge, creating a vibrant and dynamic scene.\n\nFor the first time, public seating in the terminal has been transformed into an engaging art installation. This piece retains the unique colours and shapes of Aeroplane Chess, celebrating the diversity and interconnectedness of travel. Visitors can relax within the installation, immersing themselves in the local culture while appreciating the creative works of Hong Kong artists.\n\n\nIn collaboration with: Hong Kong Arts Centre\n\nParticipating artist: STICKYLINE\n\nClick ', style: TextStyle(fontSize: 16, color: Colors.black),),
                  TextSpan(text: 'here', style: TextStyle(color: Colors.blue[900], decoration: TextDecoration.underline, fontSize: 16),
                  recognizer: TapGestureRecognizer()
                  ..onTap = () async{
                    final url = Uri.parse('https://www.hongkongairport.com/iwov-resources/file/relax-fun/art-culture/2025/The_Flow_of_Flights_Artists_Bio.pdf');
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }),
                  const TextSpan(text: ' to learn more about the collaborating organisation and artist.', style: TextStyle(color: Colors.black, fontSize: 16))]),
                ),
              )
            ],
          ),
        ),
      ],),
    );
  }
}