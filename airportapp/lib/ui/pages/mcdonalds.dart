import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Mcdonalds extends StatelessWidget {
  const Mcdonalds({super.key});

  final String _phoneNum1 = '+85222610426';
  final String _phoneNum2 = '+85239968817';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close, color: Colors.white)),
        title: Text('McDonald`s® & McCafé®', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.asset('lib/assets/mcdonalds-shop-front.jpg'),
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
                  title: Text('Near Check-in Aisle F, Departures Level(L8)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                              child: Text('Near Check-in Aisle F, Departures Level (L8), Terminal 1\n(Non-Restricted Area)', style: TextStyle(fontSize: 16)),
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
                  ]
                ),
                ExpansionTile(
                  title: Text('Near Gate 11, Departures Level (L6)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                              child: Text('Near Gate 11, Departures Level (L6)\nTerminal 1\n(Restricted Area)', style: TextStyle(fontSize: 16)),
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
                SizedBox(height: 30),
                Text('Since 1975, McDonald`s® Hong Kong has been a part of Hong Kong`s social fabric for the past 48 years. As a purpose driven and family friendly brand, McDonald`s® will deliver the next generation of customer experience through stylish restaurant designs, intuitive facilities, attentive customer service and premium food.', style: TextStyle(fontSize: 16),)
              ]
            ),
          )
        ],
      ),
    );
  }
}