import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class FlightsCart extends StatelessWidget {
  final bool isArrival;
  final String date;
  final String time;
  final String status;
  final String? destination;
  final String? origin;
  final String? terminal;
  final String? aisle;
  final String? gate;
  final String? baggage;
  final String? hall;
  final String? stand;
  final List<String> flightNumbers;
  final List<String> airlines;

  const FlightsCart({
    super.key, 
    required this.isArrival,
    required this.date,
    required this.time,
    required this.status,
    this.destination,
    this.origin,
    this.terminal,
    this.aisle,
    this.gate,
    this.baggage,
    this.hall,
    this.stand,
    required this.flightNumbers,
    required this.airlines
  });


  @override
  Widget build(BuildContext context) {
    DateTime dateFormatted = DateTime.parse(date);
    String formattedDate = DateFormat('d MMM yyyy').format(dateFormatted);
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.close, color: Colors.white)
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share, color: Colors.white))],
        flexibleSpace: Column(
          children: [
            const SizedBox(height: kToolbarHeight + 30),
            Divider(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          
        },
        child: Container(
          height: 45,
          margin: const EdgeInsets.only(right: 24, left: 24),
          decoration: BoxDecoration(
            color: Colors.blue[800], 
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black)]),
          child: Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Row(children: [Icon(Icons.add_circle_outline, color: Colors.white), SizedBox(width: 15), Text('Track Flight', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),)]),
          ),
        ),
      ),
      body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: SizedBox(
                      height: 350,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              color: Colors.yellow,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(formattedDate, style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        for(int i = 0; i < airlines.length; i++)
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(airlines[i], style: TextStyle(color: Colors.blue[900])),
                                              Row(
                                                children: [
                                                  Image.asset('lib/images/cathay_logo.png', height: 24, width: 24),
                                                  SizedBox(width: 5),
                                                  Text(flightNumbers[i], style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900]))
                                                ]  
                                              ),
                                            ],
                                          ),
                                        SizedBox(height: 10),
                                        Text(isArrival ? 'From' : 'To', style: TextStyle(color: Colors.blue[900])),
                                        Text(isArrival ? (origin?.isNotEmpty == true ? origin! : '') : (destination?.isNotEmpty == true ? destination! : ''), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900])),
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(isArrival ? 'Arrival Time' : 'Departure Time', style: TextStyle(color: Colors.blue[900])),
                                                Text(time, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900]))
                                              ],
                                            ),
                                            SizedBox(width: 90),
                                            Column(
                                              children: [
                                                Text(isArrival ? 'Baggage Reclaim' : 'Gate', style: TextStyle(color: Colors.blue[900])),
                                                Text(isArrival ? (baggage?.isNotEmpty == true ? baggage! : '') : (gate?.isNotEmpty == true ? gate! : ''), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900]))
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Divider(), 
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(color: Colors.red[900], width: 12, height: 12),
                                      Text(status, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[900], fontSize: 18))
                                    ],
                                  )
                                ],
                              ),
                          )),       
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [

                            ],
                          )
                        ],
                      )
                    ),
                  ),
                  SizedBox(height: 30),
                  Text('Travel Tips of ${isArrival ? origin : destination}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 20),
                  // ListView.builder(
                  //   itemBuilder: (context, index){
                  //     return ;
                  //   }
                  // )
                ],
              ),
            ),
          ],
        ),
    );
  }
}