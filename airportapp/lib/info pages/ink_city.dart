import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class InkCity extends StatelessWidget {
  const InkCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Ink & The City | Calligraphy in\nUrban Life',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close, color: Colors.white,)),
      ),
      body: ListView(children: [
        Image.asset('lib/assets/ink.jpg', fit: BoxFit.cover),
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
                    Text('Arrivals Hall A, Arrivals Level (L5),\nTerminal 1\n(Non-Restricted Area)',style: TextStyle(color: Colors.grey[900]),),
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
                  const TextSpan(text: '`Calligraphy is everywhere in our daily lives.`From the 1930s to the 1990s, calligraphy permeated everyday life in Hong Kong in a myriad of forms, appearing on signs, movie posters, advertisements, and business cards. It has long been woven into our collective aesthetic sensibility.\n\nThis exhibition showcases the rich tradition of applied calligraphy in Hong Kong through a dynamic mix of experiences, including multimedia displays, innovative printmaking techniques and interactive designs. It invites visitors to reflect anew on the significance of calligraphic art in everyday life, and to explore its future possibilities and adaptability. Visitors can also create their own postcards featuring unique Hong Kong calligraphy stamps, making for a meaningful souvenir to take home.\n\n\nIn collaboration with: Westley Wong\n(@ink.brush.city)\n\nParticipating organisations and artists:\n@modernismhongkong | @des.Io |\n@fafa_motion\n\nClick ', style: TextStyle(fontSize: 16, color: Colors.black),),
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