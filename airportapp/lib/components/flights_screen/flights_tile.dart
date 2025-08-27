import 'package:airportapp/components/flights_screen/flights_cart.dart';
import 'package:airportapp/data/database.dart';
import 'package:flutter/material.dart';

class FlightsTile extends StatelessWidget {
  const FlightsTile({
    Key? key, 
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
  }) : super(key: key);

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


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => FlightsCart(
              isArrival: isArrival,
              date: date,
              time: time,
              status: status,
              destination: (destination?.isNotEmpty ?? false) ? destination! : [],
              origin: (origin?.isNotEmpty ?? false) ? origin! : [],
              terminal: terminal ?? '',
              aisle: aisle ?? '',
              gate: gate ?? '',
              baggage: baggage ?? '',
              hall: hall ?? '',
              stand: stand ?? '',
              flightNumbers: flightNumbers,
              airlines: airlines,
            )
          )
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isArrival ? 'ARRIVAL' : 'DEPARTURE',
                      style: TextStyle(color: Colors.blue[800], fontSize: 15),
                    ),
                    IconButton(
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => FlightsCart(
                          isArrival: isArrival,
                          date: date,
                          time: time,
                          status: status,
                          destination: (destination?.isNotEmpty ?? false) ? destination! : [],
                          origin: (origin?.isNotEmpty ?? false) ? origin! : [],
                          terminal: terminal ?? '',
                          aisle: aisle ?? '',
                          gate: gate ?? '',
                          baggage: baggage ?? '',
                          hall: hall ?? '',
                          stand: stand ?? '',
                          flightNumbers: flightNumbers,
                          airlines: airlines,
                        )));
                      },
                      icon: const Icon(Icons.add_circle_outline),
                    ),  
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          Database.airlineLogos[airlines[0]] ?? '',
                          height: 32,
                          width: 32,
                        ),
                        Text(
                          flightNumbers[0],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      height: 40,
                      child: VerticalDivider(
                          color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            if (flightNumbers.length > 1)
                              for(int i = 1; i < flightNumbers.length; i++)
                                Text(
                                  flightNumbers[i],
                                  style: TextStyle(fontSize: 12),
                                ),
                          ]
                        ),
                      ),
                    ),
                  ]
                ),
              
                const Divider(),

                const SizedBox(height: 5),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          isArrival
                              ? (baggage?.isNotEmpty == true ? 'Belt no.$baggage' : 'Belt no.--')
                              : (gate?.isNotEmpty == true ? 'Gate $gate' : 'Gate --'),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    if ((origin?.length ?? 0) > 1 || 
                      (destination?.length ?? 0) > 1)
                        Row(
                          children: [
                            Text('Via ', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                            Text(
                              isArrival
                                ? (Database.airportCodes[origin?[1]] ?? origin![1])
                                : (Database.airportCodes[destination?[0]] ?? destination![0])
                            )
                          ],
                        ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          time,
                          style: const TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          status,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}