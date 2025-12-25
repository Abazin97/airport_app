import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class SevenEleven extends StatelessWidget {
  const SevenEleven({super.key});

  final String _phoneNum1 = '+85222620366';
  final String _phoneNum2 = '+85229821683';
  final String _phoneNum3 = '+85228948872';
  final String _phoneNum4 = '+85229849366';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close, color: Colors.white)),
        title: Text('7-ELEVEN', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.asset('lib/assets/seven-eleven-shop-front-photo.jpg'),
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
                  title: Text('Near Berth 5, Ferry Departure Level (L4)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                              child: Text('Near Berth 5, Ferry Departure Level (L4), SkyPier Terminal\n(Restricted Area)', style: TextStyle(fontSize: 16)),
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
                              Text(' • 07:30 - 22:00', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                ExpansionTile(
                  title: Text('Before Immigration Hall, Arrivals Level (L5)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                              child: Text('Before Immigration Hall, Arrivals Level (L5), Terminal 1\n(Restricted Area)', style: TextStyle(fontSize: 16)),
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
                              Text(' • 00:00 - 24:00', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ]
                ), 
                ExpansionTile(
                  title: Text('Arrivals Hall, Arrivals Level (L6)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                              child: Text('Arrivals Hall, Arrivals Level (L6),\nTerminal 1\n(Non-Restricted Area)', style: TextStyle(fontSize: 16)),
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
                              Text(' • 06:00 - 24:00', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                ExpansionTile(
                  title: Text('End of Check-in Aisle E, Departures Level (L7)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                              child: Text('End of Check-in Aisle E, Departures Level (L7), Terminal 1\n(Non-Restricted Area)', style: TextStyle(fontSize: 16)),
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
                              Text(' • 00:00 - 24:00', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
                SizedBox(height: 30),
                Text('Round-the-clock convenience store offering handy items such as pre-packed meals, sandwiches, drinks, newspapers, magazines, personal care items, etc.', style: TextStyle(fontSize: 16),)
              ]
            ),
          ),
          SizedBox(height: 50),
        ]
      )
    );
  }
}