import 'package:airportapp/components/flights_cart.dart';
import 'package:airportapp/models/flight_info.dart';
import 'package:flutter/material.dart';

class FlightsTile extends StatelessWidget {
  FlightsTile({
    Key? key, 
    required this.flightData,
  }) : super(key: key);

  final FlightInfo flightData;
  void Function()?onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FlightsCart(status: flightData.status, airlineLogo: 'lib/images/cathay_logo.png', flightNo: flightData.flightNo, destination: flightData.dest, time: flightData.time, aisle: flightData.aisle, gate: flightData.gate,)));
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
                      flightData.status,
                      style: TextStyle(color: Colors.blue[800], fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => FlightsCart(status: flightData.status, airlineLogo: 'lib/images/cathay_logo.png', flightNo: flightData.flightNo, destination: flightData.dest, time:flightData.time, aisle: flightData.aisle, gate: flightData.gate,)));
                      },
                      icon: const Icon(Icons.add_circle_outline),
                    ),  
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'lib/images/cathay_logo.png',
                          height: 24,
                          width: 24,
                        ),
                        Text(
                          flightData.flightNo[0],
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ]
                    ),
                    SizedBox(
                      height: 40,
                      child: Transform.translate(
                        offset: Offset(-80, 0),
                        child: VerticalDivider(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Text(
                      flightData.flightNo[0],
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ]
                ),
              
                const Divider(),

                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          flightData.dest,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          flightData.time,
                          style: const TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          flightData.aisle,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'data',
                          style: const TextStyle(color: Colors.grey),
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