import 'package:airportapp/ui/info_pages/faq.dart';
import 'package:airportapp/ui/pages/manage_booking.dart';
import 'package:airportapp/ui/pages/parking_booking.dart';
import 'package:flutter/material.dart';

class BookParking extends StatelessWidget {
  const BookParking({super.key});

  static const List<String> title = [
    'Book and Pay Online',
    'Drop-off your car & Fly',
    'Pick-up and Leave'
  ];

  static const List<String> desc = [
    'Book the valet parking services 1-60 days in advance',
    'Drop-off your car at Departure Kerb',
    'Pick-up your car at Car Park 4 upon arrival'
  ];  

  static const List<IconData> icon = [
    Icons.car_rental_outlined,
    Icons.local_parking,
    Icons.local_parking
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Valet Parking Booking',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => Faq()));
            }, 
            icon: Icon(
              Icons.info_outline, 
              color: Colors.white
            )
          ),
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [ 
            Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent), 
              child: ExpansionTile( 
                title: Text('Valet Parking at HKIA', style: TextStyle(fontWeight: FontWeight.bold,)), 
                children: [ 
                  SizedBox(height: 250, 
                  child: ListView.builder( 
                    itemCount: 3, 
                    scrollDirection: Axis.horizontal, 
                    itemBuilder: (context, index){ 
                      return Padding( 
                        padding: const EdgeInsets.all(10), 
                        child: scrollTile(
                          title[index], desc[index], icon[index]
                        ), 
                      ); 
                    }),
                  ) 
                ] 
              ), 
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ParkingBooking()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.local_parking, color: Colors.blue[900]),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Book Valet Parking service', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.blue[900],),
                ],
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (context) => ManageBooking()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.local_parking, color: Colors.blue[900]),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Manage Valet Parking Booking', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.blue[900],),
                ],
              ),
            ),
            Divider()
          ],),
        ) 
    ]),); 
  }
}

Widget scrollTile(String title, String desc, IconData icon){
  return Container(
    width: 170,
    decoration: BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(60),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 2),
          )
        ],
    ),
    child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.blue[900],),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            SizedBox(height: 10,),
            Text(desc, style: TextStyle(color: Colors.grey[600]),)
          ],
        ),
      ),
    ],),
  );
}