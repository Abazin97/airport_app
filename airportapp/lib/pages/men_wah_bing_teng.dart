import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MenWahBingTeng extends StatelessWidget {
  const MenWahBingTeng({super.key});

  final String _phoneNum1 = '+85222620366';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close, color: Colors.white)),
        title: Text('Men Wah Bing Teng', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.asset('lib/assets/men_wah_bing_teng-shop-front.jpg'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_add_outlined, color: Colors.blue[800],)),
              IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined, color: Colors.blue[800],))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.map_outlined, color: Colors.grey[500]),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Near Gate 11, Departures Level(L6),\nTerminal 1\n(Restricted Area)', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      Icon(Icons.location_on_outlined, color: Colors.blue[800],),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey[900],
                ),
                SizedBox(
                  height: 40,
                  child: GestureDetector(
                    onTap: () async{await FlutterPhoneDirectCaller.callNumber(_phoneNum1);},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.phone_outlined, color: Colors.grey[500]),
                        Text(_phoneNum1, style: TextStyle(fontSize: 16)),
                        Icon(Icons.phone_callback_outlined, color: Colors.blue[800],),
                      ]
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey[900],
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(Icons.more_time, color: Colors.grey[500]),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Text('Open now', style: TextStyle(fontSize: 16, color: Colors.red)),
                          Text(' • 00:00 - 24:00', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 30),
                Text('"Men Wah Bing Teng" brand is originated from a standalone "bing sutt" named Men Wah Bing Teng in Kowloon, Hong Kong with a long history dating back to 1970`s. "Men Wah Bing Teng" serves Hong Kong traditional "bing sutt" with western-style fast food snacks. Signature dishes such as Men Wah BBQ Pork with Egg and Rice, Egg in Boiling Water and Sa Cha Beef Noodles, which we believe allows our customers to reminisce on such earlier years of Hong Kong.', style: TextStyle(fontSize: 16),)
              ]
            ),
          ),
          SizedBox(height: 50)
        ]
      )
    );
  }
}