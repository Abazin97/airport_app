import 'package:airportapp/providers/nav_provider.dart';
import 'package:airportapp/info_pages/airport_express.dart';
import 'package:airportapp/info_pages/announcement.dart';
import 'package:airportapp/info_pages/faq.dart';
import 'package:airportapp/info_pages/department_website.dart';
import 'package:airportapp/info_pages/private_cars_charges.dart';
import 'package:airportapp/info_pages/private_moto_charges.dart';
import 'package:airportapp/info_pages/skylimo.dart';
import 'package:airportapp/info_pages/skypier_transfer.dart';
import 'package:airportapp/info_pages/taxi_parking_area.dart';
import 'package:airportapp/pages/book_parking.dart';
import 'package:airportapp/pages/mm_coaches.dart';
import 'package:airportapp/pages/public_buses.dart';
import 'package:airportapp/info_pages/resident_coaches.dart';
import 'package:airportapp/info_pages/special_transport.dart';
import 'package:airportapp/info_pages/taxis.dart';
import 'package:airportapp/pages/skypier_ferry.dart';
import 'package:airportapp/pages/traffic_condition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class TransportToFrom extends StatefulWidget {
  final int? pageIndex;
  const TransportToFrom({super.key, this.pageIndex});

  @override
  State<TransportToFrom> createState() => _TransportToFromState();
}

class _TransportToFromState extends State<TransportToFrom> {
  int selectedIndex = 3;
  late List<Widget> pages;
  final List<Widget> infoPages = [
    const AirportExpress(),
    const Taxis(),
    const PublicBuses(),
    const SpecialTransport(),
    const ResidentCoaches(),
    const SkypierFerry(),
    const MmCoaches(),
    const Skylimo(),
    const SkypierTransfer()
  ];

  @override
  void initState(){
    if (widget.pageIndex == 2){
      selectedIndex = widget.pageIndex!;
    }
    pages = [
      toFrom(),
      connection(),
      parking(),
      valetParking()
    ];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Transport to / from airport',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
        leading: IconButton(
          onPressed: () {
            if (widget.pageIndex == 2){
              Navigator.pop(context);
            }else{
              Provider.of<NavProvider>(context, listen: false).pageIndex = 0;
            }
          },
          icon: Icon(
            widget.pageIndex == 2
            ? Icons.close
            : Icons.arrow_back_ios_outlined,
            color: Colors.white,
          )
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
        bottom:  PreferredSize(
          preferredSize: Size.fromHeight(210), 
          child: Container(
            color: Colors.white,
            height: 210,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filterButton('To & From Airport', Icons.airport_shuttle_outlined, 0),
                      filterButton('Mainland & Macao Connection', Icons.directions_boat_outlined, 1)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filterButton('Parking', Icons.local_parking_outlined, 2),
                      filterButton('Valet Parking', Icons.local_parking_outlined, 3)
                    ],
                  )
                ],
              ),
            ),
          )),
      ),
      body: pages[selectedIndex],
    );
  }

  Widget filterButton(String name, IconData icon, int indexFilter){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = indexFilter;
        });
      },
      child: Container(
        width: 160,
        height: 80,
        decoration: BoxDecoration(
          color: selectedIndex == indexFilter ? Colors.blue[800] : Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            )
          ]
        ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(icon, color: selectedIndex == indexFilter ? Colors.yellow : Colors.blue[900],),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: selectedIndex == indexFilter ? Colors.white : Colors.black,),),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget travelOptionsButton(BuildContext context, String name, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          fullscreenDialog: true,
          builder: (builder) => infoPages[index]));
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.blue[900], size: 40),
            const SizedBox(height: 10),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget parking(){
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (context) => BookParking())), 
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900],),
            child: Text('Book Parking', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Parking', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                SizedBox(height: 20),
                Text('Special Announcement', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(fullscreenDialog: true,builder: (context) => Announcement())),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(20),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(Icons.priority_high_outlined, color: Colors.redAccent,size: 40,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Text('Click for Transport Department`s website', style: TextStyle(decoration: TextDecoration.underline)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Car Parks Space Availability', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Text('(Last update on ??)', style: TextStyle(color: Colors.grey, fontSize: 12),),
                SizedBox(height: 20),
                Text('HKIA Car Parks (Private Cars)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    width: double.infinity,
                    height: 240,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Car Park', style: TextStyle(fontSize: 12)),
                              Text('Hourly', style: TextStyle(fontSize: 12)),
                              SizedBox(
                                width: 60,
                                child: Text('Daily & Long-Term', 
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: TextStyle(fontSize: 12),)),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text('Car Park 1', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                  IconButton(
                                    onPressed: () {
                                      
                                    },
                                    icon: Icon(Icons.location_on_outlined, color: Colors.blue[900],))
                                ],
                              ),
                              Text('132', style: TextStyle(fontSize: 16, color: Colors.blue[900], fontWeight: FontWeight.bold)),
                              Text('N/A', style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text('Car Park 4', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                  IconButton(
                                    onPressed: () {
                                      
                                    },
                                    icon: Icon(Icons.location_on_outlined, color: Colors.blue[900],))
                                ],
                              ),
                              Text('Spaces', style: TextStyle(fontSize: 16, color: Colors.blue[900], fontWeight: FontWeight.bold)),
                              Text('Spaces', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue[900]),),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Text('11 SKIES Car Park', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
                Container(
                  width: double.infinity,
                  height: 156,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(20),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Car Park', style: TextStyle(fontSize: 12)),
                            SizedBox(
                              width: 80,
                              child: Text('Hourly, Daily & Long-Term', 
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: TextStyle(fontSize: 12),)),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('11 SKIES Car Park', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Text('1043', style: TextStyle(fontSize: 16, color: Colors.blue[900], fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async{
                                final url = Uri.parse('https://www.nwd.com.hk/property/lease/11skies');
                                await launchUrl(url, mode: LaunchMode.inAppWebView);
                              },
                              child: Text('More', style: TextStyle(color: Colors.blue[900], fontSize: 12),)),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue[900],size: 12,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Text('HKIA Car Parks\n(Urban & Lantau Taxi + Lights Goods Vehicle)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
                Container(
                  width: double.infinity,
                  height: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(20),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Car Park', style: TextStyle(fontSize: 12)),
                            Text('Hourly', style: TextStyle(fontSize: 12)),
                            SizedBox(
                              width: 60,
                              child: Text('Daily & Long-Term', 
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: TextStyle(fontSize: 12),)),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 80, child: Text('Urban & Lantau Taxi', textAlign: TextAlign.start, softWrap: true, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
                                IconButton(
                                  onPressed: () {
                                    
                                  },
                                  icon: Icon(Icons.location_on_outlined, color: Colors.blue[900],))
                              ],
                            ),
                            Text('Spaces', style: TextStyle(fontSize: 16, color: Colors.blue[900], fontWeight: FontWeight.bold)),
                            Text('Spaces', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue[900]),),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 80, child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text('Light Goods Vehicle', textAlign: TextAlign.start, softWrap: true, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                    Text('Hourly', textAlign: TextAlign.start,softWrap: true, style: TextStyle(fontSize: 12),)
                                  ],
                                )),
                                IconButton(
                                  onPressed: () {
                                    
                                  },
                                  icon: Icon(Icons.location_on_outlined, color: Colors.blue[900],))
                              ],
                            ),
                            Text('Spaces', style: TextStyle(fontSize: 16, color: Colors.blue[900], fontWeight: FontWeight.bold)),
                            Text('N/A', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 80, child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text('Light Goods Vehicle', textAlign: TextAlign.start, softWrap: true, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                    Text('Long-Term', textAlign: TextAlign.start, softWrap: true, style: TextStyle(fontSize: 12),)
                                  ],
                                )),
                                IconButton(
                                  onPressed: () {
                                    
                                  },
                                  icon: Icon(Icons.location_on_outlined, color: Colors.blue[900],))
                              ],
                            ),
                            Text('N/A', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text('Spaces', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue[900]),),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Text('HKIA Car Park Charges', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ),
                Divider(),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PrivateCarsCharges())),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('HKIA Car Parks (Private Cars)', style: TextStyle(fontWeight: FontWeight.bold),), Icon(Icons.arrow_forward_ios, color: Colors.blue[900],)],)
                ),
                Divider(),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PrivateMotoCharges())),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('HKIA Car Parks (Motorcycles)', style: TextStyle(fontWeight: FontWeight.bold),), Icon(Icons.arrow_forward_ios, color: Colors.blue[900],)],)
                ),
                Divider(),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TaxiParkingArea())),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        Text('HKIA Car Parks (Urban & Lantau Taxi + Light Goods Vehicle)', style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ), Icon(Icons.arrow_forward_ios, color: Colors.blue[900],)],)
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Text('Condition of Use', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ),
                Text('1.  When the long-term parking spaces in Car Park 4 are nearly fully occupied, users may be diverted to other car parks for parking. Please reserve sufficient time when driving to the airport.\n\n2.  The car parks space availability information provided in this App ("Space Availability") are for intended Car Parks users` general reference only and are not intended for other purposes. Upon your access to the Car Park Space Availability, you agree to be bound by the Terms and Conditions on this App.\n\n3. The Space Availability are provided on a regular basis and subject to change without further notice. Intended car parks users should check the car park space availability at relevant car parks.'),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 15),
                  child: Text('Traffic Condition', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget valetParking(){
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (context) => BookParking())), 
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900],),
            child: Text('Book Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Valet Parking', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Text('Service Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                Text('Service hours: 24 hr', style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('Parking period: 1 hour to 30 days', style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Vehicle drop-off point: Departure Kerb Zone 4', style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.location_on_outlined, color: Colors.blue[900],))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Column(
                          children: [
                            Text('Vehicle pick-up point: 6/F of Car Park 4 (Valet Parking Service Counter)', style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                          ],
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.location_on_outlined, color: Colors.blue[900]))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text('Charges', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Valet parking service (*)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),), Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('(Booking)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                        Text(' HKD ', style: TextStyle(color: Colors.blue[900]),),
                        Text('\$180', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900], fontSize: 16),)
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('(Walk-in)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                        Text(' HKD ', style: TextStyle(color: Colors.blue[900]),),
                        Text('\$180', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900], fontSize: 16),)
                    ],)],)],
                ),
                Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Add-on car cleaning service (**)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),), Row(children: [Text('HKD ', style: TextStyle(color: Colors.blue[900])), Text('\$20', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900], fontSize: 16),)],)],),
                Divider(),
                Text('(*) Parking charges are not included and will be calculated according to the actual time of dropping off and exit.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                Text('(**) Car cleaning services are only available to valet parking booking with a parking duration of 3 days or more.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Text('Notes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: Text('1. This service is applicable to private car only.\n\n2. Each booking can be amended once only and must be made at least 1 day prior to the booked drop-off day.\n\n3. An administration fee of HK\$50 will be charged for each booking cancellation. The cancellation must be made at least 1 day prior to the booked drop-off day.', style: TextStyle(color: Colors.grey[700], fontSize: 12),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget toFrom(){
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Local Transport', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              SizedBox(height: 40),
              Text('Hong Kong traffic conditions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              SizedBox(height: 30),
              Text('The road traffic condition and traveling time are provided by Google and for reference only.',),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(fullscreenDialog: true,builder: (context) => TrafficCondition())),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.commute_outlined, color: Colors.blue[900],),
                          Icon(Icons.arrow_forward_ios_outlined, color: Colors.blue[900],)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Text('You may check out the traffic conditions of all major roads in Hong Kong',),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(fullscreenDialog: true,builder: (context) => DepartmentWebsite())),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(Icons.add_road_outlined, color: Colors.blue[900],),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text('Click for Transport Department`s website', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text('How to travel to/from the airport?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          travelOptionsButton(context, 'Airport Express', Icons.train_outlined, 0),
                          travelOptionsButton(context, 'Taxis', Icons.local_taxi_outlined, 1)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          travelOptionsButton(context, 'Public Buses', Icons.airport_shuttle_outlined, 2),
                          travelOptionsButton(context, 'Transport For Special Needs', Icons.emergency_outlined, 3)
                        ],
                      ),
                      travelOptionsButton(context, 'Resident`s Coaches', Icons.directions_car_outlined, 4),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget connection(){
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mainland &\nMacao Connection', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset('lib/assets/bridge.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text('Hong Kong International Airport is a multi-modal transport centre, offering travellers extensive land and sea connections to cities throughout Greater Bay Area(GBA).', style: TextStyle(color: Colors.grey[900]),),
              ),
              Text('How to travel to/from the airport?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: SizedBox(
                  height: 330,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          travelOptionsButton(context, 'SkyPier Terminal Ferry', Icons.directions_ferry_outlined, 5),
                          travelOptionsButton(context, 'Mainland / Macao Coaches', Icons.airport_shuttle_outlined, 6)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          travelOptionsButton(context, 'SkyLimo', Icons.directions_car_filled_outlined, 7),
                          travelOptionsButton(context, 'SkyPier Terminal Transfer Coach', Icons.bus_alert_outlined, 8)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}