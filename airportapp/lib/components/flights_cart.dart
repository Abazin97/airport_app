import 'package:flutter/material.dart';


class FlightsCart extends StatelessWidget {
  final String status;
  final String airlineLogo;
  final List<String> flightNo;
  final String destination;
  final String time;
  final String aisle;
  final String gate;
  const FlightsCart({super.key, required this.status, required this.airlineLogo, required this.flightNo, required this.destination, required this.time, required this.aisle, required this.gate});

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: kToolbarHeight + 8),
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
              padding: const EdgeInsets.all(25),
              child: ClipRRect(
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
                            child: Text('data', style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('data', style: TextStyle(color: Colors.blue[800])),
                                Row(
                                  children: [
                                    Image.asset(airlineLogo, height: 24, width: 24),
                                    SizedBox(width: 5),
                                    Text(flightNo[0], style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[800]))
                                  ]  
                                ),
                                SizedBox(height: 10),
                                Text('To', style: TextStyle(color: Colors.blue[800])),
                                Text(destination, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[800])),
                                SizedBox(height: 20),
                                Text('data', style: TextStyle(color: Colors.blue[800])),
                                Text(time, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[800]))
                              ],
                            ),
                          ),
                      ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}