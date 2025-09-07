import 'package:airportapp/data/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class FlightsCart extends StatelessWidget {
  final bool isArrival;
  final String date;
  final String time;
  final String status;
  final List<String>? destination;
  final List<String>? origin;
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
                                        SizedBox(
                                          height: 80,
                                          child:  ListView.builder(
                                            itemCount: airlines.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index){
                                              final code = airlines[index];
                                              final airlineName = Database.airlineCodes[code];
                                              final airlineLogo = Database.airlineLogos[code];
                                              final flightNo = flightNumbers[index];
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(airlineName ?? '', style: TextStyle(color: Colors.blue[900])),
                                                    Row(
                                                      children: [
                                                        if (airlineLogo != null && airlineLogo.isNotEmpty)
                                                        Image.asset(airlineLogo, height: 34, width: 34),
                                                        SizedBox(width: 5),
                                                        Text(flightNo, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900]))
                                                      ]  
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(isArrival ? 'From' : 'To', style: TextStyle(color: Colors.blue[900])),
                                        Text(
                                          isArrival
                                              ? ((origin?.isNotEmpty == true)
                                                  ? (Database.airportCodes[origin?[0]] ?? origin![0])
                                                  : "--")
                                              : ((destination?.isNotEmpty == true)
                                                  ? ((destination!.length > 1)
                                                      ? (Database.airportCodes[destination?[1]] ?? destination![1])
                                                      : (Database.airportCodes[destination?[0]] ?? destination![0]))
                                                  : "--"),
                                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900]),
                                        ),
                                        if ((origin?.length ?? 0) > 1 || 
                                          (destination?.length ?? 0) > 1)
                                            Row(
                                              children: [
                                                Text('via ', style: TextStyle(color: Colors.blue[900], fontSize: 12)),
                                                Text(
                                                  isArrival
                                                    ? (Database.airportCodes[origin?[1]] ?? origin![1])
                                                    : (Database.airportCodes[destination?[0]] ?? destination![0]),
                                                  style: TextStyle(color: Colors.blue[900], fontSize: 12),
                                                )
                                              ],
                                            ),
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
                                            SizedBox(width: 70),
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
                  Text('Travel Tips of ${isArrival 
                    ? Database.airportCodes[origin?[0]] 
                    : ((destination!.length > 1)
                      ? (Database.airportCodes[destination?[1]] ?? destination![1])
                      : (Database.airportCodes[destination?[0]] ?? destination![0]))}', 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 50),
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