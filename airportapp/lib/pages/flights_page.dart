import 'package:airportapp/components/bottom_nav_bar.dart';
import 'package:airportapp/components/calendar_cell.dart';
import 'package:airportapp/data/database.dart';
import 'package:airportapp/models/flight_info.dart';
import 'package:airportapp/components/flights_tile.dart';
import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class FlightsPage extends StatefulWidget {
  const FlightsPage({super.key});

  @override
  State<FlightsPage> createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage> {

  String selected = 'All';
  int selectedIndex = 1;
  DateTime today = DateTime.now();

  List<FlightInfo>? _flightsList;
  Database db = Database();
  
  

  List<String> image = [
    'lib/images/pocket_wifi.jpg',
    'lib/images/home_checkin.jpg',
    'lib/images/vintage_buggy.jpg',
    'lib/images/culinary.jpg',
    'lib/images/buggy.jpg',
    'lib/images/round_trip.jpg'
  ];

  List<String> tileLinks = [
    'https://www.hkairportbooking.com/en/wbb00002.html',
    'https://www.hkairportbooking.com/en/sfe00014.html',
    'https://www.hkairportbooking.com/en/ppg00013.html',
    'https://www.hkairportbooking.com/en/ppg00009.html',
    'https://www.hkairportbooking.com/en/ppg00008.html',
    'https://www.hkairportbooking.com/en/ctf00001.html'
  ];

  
  Widget flightsButton(String label){
    bool isSelected = selected == label;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(110, 35),
        backgroundColor: isSelected ? Colors.yellow : Colors.white,
        textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
      ),
      onPressed: (){
        setState(() {
          selected = label;
        });
      },
      child: Text(label),
    );
  }

  Future<void> loadFlights() async {
    //_flightsList = await db.fetchData();
    setState(() {});
  }

  @override
  void initState() {
    loadFlights();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 400,
            backgroundColor: Colors.blue[600],
            leading: IconButton(
                onPressed: () {
                  Provider.of<NavProvider>(context, listen: false).pageIndex = 0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'Flights',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            centerTitle: true,
            toolbarHeight: 50, 
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(top: kToolbarHeight + MediaQuery.of(context).padding.top),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'e.g. Airport, Flight no., Airline or Time',
                                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                      border: InputBorder.none,
                                      isCollapsed: true,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            return IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.document_scanner,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Stack(
                      children: [
                        SizedBox(
                          height: 70,
                          child: ListView.builder(
                            itemCount: 16,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CalendarCell(
                                index: index,
                                isSelected: selectedIndex == index,
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                date: today.add(Duration(days: index - 1)),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          const Divider(color: Colors.white),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              flightsButton('All'),
                              flightsButton('Departures'),
                              flightsButton('Arrivals'),
                            ],
                          ),
                          const SizedBox(height: 10), 
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        itemCount: tileLinks.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              final _url = Uri.parse(tileLinks[index]);
                              await launchUrl(_url, mode: LaunchMode.inAppWebView);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10, left: 10),
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.white, width: 3),
                              ),
                              child: Image.asset(
                                image[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /* SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final flight = _flightsList![index];

                return FlightsTile(flightData: flight);
              },
              childCount: _flightsList!.length,
            ),
          ), */

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 60),
              child: Text('Flight information is subject to changes. Please be reminded to check with your airlines for the latest flight details', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
            ),
          )
          //SliverFillRemaining(),
        ],
      ),
    );
  }
}