import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class BeautyAndYou extends StatelessWidget {
  const BeautyAndYou({super.key});

  final String _phoneNum1 = '+85222620366';
  final String _phoneNum2 = '+85229821683';
  final String _phoneNum3 = '+85228948872';
  final String _phoneNum4 = '+85229849366';
  final String _phoneNum5 = '+85222610339';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close, color: Colors.white)),
        title: Text('Beauty&You by The Shilla Duty Free\n(Beauty & Personal Care)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () async{
          final _url = Uri.parse('https://hkairportshop.com/eshop_en/exclusive_prelaunch_apr24');
          await launchUrl(_url, mode: LaunchMode.inAppBrowserView);
        },
        child: Container(
          height: 45,
          margin: const EdgeInsets.only(right: 24, left: 24),
          decoration: BoxDecoration(
            color: Colors.blue[800], 
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black)]),
          child: Center(child: Text('Shop now', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),)),
        ),
      ),
      body: ListView(
        children: [
          Image.asset('lib/assets/beauty.jpg'),
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
                ExpansionTile(
                  title: Text('Near Transfer Desk E1, Arrivals Level (L5)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.map_outlined, color: Colors.grey[500]),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Near Transfer Desk E1, Arrivals Level (L5), Terminal 1\n(Restricted Area)', 
                                style: TextStyle(fontSize: 16),
                                softWrap: true,),
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
                              Text(' • 07:00 - 23:00', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                ExpansionTile(
                  title: Text('Near Gate 13-21, Departures Level (L5)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                              child: Text(
                                'Near Gate 13-21, Departures Level (L5), T1 Satellite Concourse,\nTerminal 1\n(Restricted Area)', 
                                style: TextStyle(fontSize: 16),
                                softWrap: true,),
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
                        onTap: () async{await FlutterPhoneDirectCaller.callNumber(_phoneNum2);},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.phone_outlined, color: Colors.grey[500]),
                            Text(_phoneNum2, style: TextStyle(fontSize: 16)),
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
                              Text(' • 08:00 - 20:00', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ]
                ), 
                ExpansionTile(
                  title: Text('Near Gate 1, Departures Level (L6)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                              child: Text(
                                'Near Gate 1, Departures Level(L6), Terminal 1\n(Restricted Area)', 
                                style: TextStyle(fontSize: 16),
                                softWrap: true,),
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
                        onTap: () async{await FlutterPhoneDirectCaller.callNumber(_phoneNum3);},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.phone_outlined, color: Colors.grey[500]),
                            Text(_phoneNum3, style: TextStyle(fontSize: 16)),
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
                              Text(' • 07:00 - 23:00', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                ExpansionTile(
                  title: Text('Near Gate 5, Departures Level (L6)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.map_outlined, color: Colors.grey[500]),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Near Gate 5, Departures Level(L6),\nTerminal 1\n(Restricted Area)', style: TextStyle(fontSize: 16)),
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
                        onTap: () async{await FlutterPhoneDirectCaller.callNumber(_phoneNum4);},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.phone_outlined, color: Colors.grey[500]),
                            Text(_phoneNum4, style: TextStyle(fontSize: 16)),
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
                              Text(' • 07:00 - 23:00', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                ExpansionTile(
                  title: Text('Near Gate 201-230, Departures Level (L6)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                              child: Text('Near Gate 201-230, Departures Level (L6), T1 Midfield Concourse,\nTerminal 1\n(Restricted Area)', style: TextStyle(fontSize: 16)),
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
                        onTap: () async{await FlutterPhoneDirectCaller.callNumber(_phoneNum5);},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.phone_outlined, color: Colors.grey[500]),
                            Text(_phoneNum5, style: TextStyle(fontSize: 16)),
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
                              Text(' • 06:00 - 23:00', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                ExpansionTile(
                  title: Text('Near Gate 35, Departures Level (L6)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                              child: Text('Near Gate 35, Departures Level (L6), Terminal 1\n(Restricted Area)', style: TextStyle(fontSize: 16)),
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
                        onTap: () async{await FlutterPhoneDirectCaller.callNumber(_phoneNum5);},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.phone_outlined, color: Colors.grey[500]),
                            Text(_phoneNum5, style: TextStyle(fontSize: 16)),
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
                              Text(' • 07:00 - 01:00', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                SizedBox(height: 30),
                Text('Beauty&You by The Shilla Duty Free offers the widest range of skincare products, cosmetics and perfumes, bringing you the most attractive deals on your favourite brands. Discover the ultimate airport shopping experience at Beauty&You.', style: TextStyle(fontSize: 16),),
                SizedBox(height: 60)
              ]
            ),
          )
        ],
      ),
    );
  }
}