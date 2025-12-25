import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HkiaLive extends StatelessWidget {
  const HkiaLive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'HKIA Live',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close, color: Colors.white,)),
      ),
      body: ListView(children: [
        Image.asset('lib/assets/live.jpg', fit: BoxFit.cover),
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
                    Text('Arrivals Hall A, Arrivals Level(L5),\nTerminal 2\n(Non-Restricted Area)',style: TextStyle(color: Colors.grey[900]),),
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
                    Text('26 July to 2 August 2025', style: TextStyle(color: Colors.grey[900])),
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
                  const TextSpan(text: 'HKIA Arts & Culture Festival brings together Hong Kong’s accomplished artists and groups to present travellers with a rich and diverse feast of performing arts. From classical music to choral performances and dance shows, the programme offers an exciting variety of live performances. Featuring both emerging young talents and established artists, the programme offers a glimpse of Hong Kong’s distinctive cultural character.\n\nClick ', style: TextStyle(fontSize: 16, color: Colors.black),),
                  TextSpan(text: 'here', style: TextStyle(color: Colors.blue[900], decoration: TextDecoration.underline, fontSize: 16),
                  recognizer: TapGestureRecognizer()
                  ..onTap = () async{
                    final url = Uri.parse('https://www.hongkongairport.com/iwov-resources/file/relax-fun/art-culture/2025/Arts_Culture_2025_Live_Timetable.pdf');
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }),
                  const TextSpan(text: ' for the performance schedule.', style: TextStyle(color: Colors.black, fontSize: 16))]),
                ),
              )
            ],
          ),
        ),
      ],),
    );
  }
}