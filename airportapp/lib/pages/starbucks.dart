import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Starbucks extends StatelessWidget {
  const Starbucks({super.key});

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
        title: Text('STARBUCKS', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.asset('lib/images/starbucks-shop-front.jpg'),
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
                  title: Text('Near Gate 44, Departures Level (L6)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.map_outlined, color: Colors.grey[500]),
                          Text('Near Gate 44, Departures Level\n(L6), Terminal 1\n(Restricted Area)', style: TextStyle(fontSize: 16)),
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
                          Row(
                            children: [
                              Text('Temporarily Closed', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                ExpansionTile(
                  title: Text('End of Check-in Aisle E, Departure Level (L7)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.map_outlined, color: Colors.grey[500]),
                          Text('End of Check-in Aisle E, Departure\nLevel (L7), Terminal 1\n(Non-Restricted Area)', style: TextStyle(fontSize: 16)),
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
                  title: Text('Near Gate 206, Departures Level (L6)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.map_outlined, color: Colors.grey[500]),
                          Text('Near Gate 206, Departures Level\n(L6), Midfield Concourse, Terminal 1\n(Restricted Area)', style: TextStyle(fontSize: 16)),
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
                          Row(
                            children: [
                              Text('Open now', style: TextStyle(fontSize: 16, color: Colors.red)),
                              Text(' • 06:00 - 24:00', style: TextStyle(fontSize: 16)),
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
                          Text('Near Gate 13-21, Departures Level\n(L5), T1 Sattelite Concourse,\nTerminal 1\n(Restricted Area)', style: TextStyle(fontSize: 16)),
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
                  title: Text('Near Gate 6, Departures Level (L6)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.map_outlined, color: Colors.grey[500]),
                          Text('Near Gate 6, Departures Level (L6),\nTerminal 1\n(Restricted Area)', style: TextStyle(fontSize: 16)),
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
                SizedBox(height: 30),
                Text('The famous American coffee icon is now available at the airport in addition to their many outlets in Hong Kong. If you enjoy rich milky coffee, Starbucks is for you.', style: TextStyle(fontSize: 16),)
              ]
            ),
          )
        ],
      ),
    );
  }
}