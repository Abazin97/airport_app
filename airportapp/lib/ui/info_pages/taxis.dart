import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Taxis extends StatelessWidget {
  const Taxis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Taxis',
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
            onPressed: () async{
              final urlPreview = 'https://www.hongkongairport.com/apps/contentPage?pageId=taxis';
              await SharePlus.instance.share(ShareParams(text: 'I would like to share "Taxis" with you.\n\nClick here for details: $urlPreview', subject: 'I would like to share "Taxis" with you.'));
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
                Image.asset('lib/assets/taxis.jpg'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Text('Taxis offer a door to door service to and from Hong Kong International Airport. Arriving passengers can catch a taxi at the Taxi Station, located near the left-hand ramp outside the Arrivals Hall.', style: TextStyle(fontSize: 16),),
                ),
                Text('Hong Kong taxis are colour-coded according to their operating areas. Separate rows are designated for different taxi types:', style: TextStyle(fontSize: 16),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("• ", style: TextStyle(fontSize: 20)),
                      const Expanded(
                        child: Text(
                          "Urban taxis (red) operate in most areas in Hong Kong (except partial of Thung Chung Road and roads in south Lantau).",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 20)),
                    const Expanded(
                      child: Text(
                        "New Territories taxis (green) mainly operate in the north-eastern part (i.e. north of Sha-Tin) and north-western part (i.e. north of Tsuen Wan) of the New Territories.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("• ", style: TextStyle(fontSize: 20)),
                      const Expanded(
                        child: Text(
                          "Lantau taxis (blue) operate only on Lantau island and Chek Lap Kok.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 20)),
                    const Expanded(
                      child: Text(
                        "All taxis are allowed to provide services at the passenger terminals of Hong Kong International Airport.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Image.asset('lib/assets/taxi_schedule.jpg'),
                ),
                Text('NOTE:', style: TextStyle(fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("• ", style: TextStyle(fontSize: 20)),
                      const Expanded(
                        child: Text(
                          "Baggage charge may be levied on every piece of baggage that is carried inside the baggage compartment, and every piece of baggage with total dimensions (length + width + height) exceeding 140cm that is carried inside the passenger compartment. In addition, there is no limit on the number of baggage carried by passengers inside a taxi in Hong Kong. A taxi can normally carry about three suitcases of regular size (1.7m length x 0.7m width x 0.5m height) in a baggage compartment.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            )
          )
        ],
      ),
    );
  }
}