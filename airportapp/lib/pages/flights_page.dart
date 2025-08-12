import 'package:airportapp/components/flights_screen/calendar_cell.dart';
import 'package:airportapp/models/flightDay.dart';
import 'package:airportapp/components/flights_screen/flights_tile.dart';
import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/pages/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class FlightsPage extends StatefulWidget {
  const FlightsPage({super.key});

  @override
  State<FlightsPage> createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage> {
  List<FlightDay> _flights = [];
  final dio = Dio();
  String selected = 'All';
  int selectedIndex = 1;
  bool flightsFilter = false;
  DateTime today = DateTime.now();
  String dayStr = DateTime.now().day.toString().padLeft(2, '0');
  

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
        minimumSize: Size(100, 35),
        backgroundColor: isSelected ? Colors.yellow : Colors.white,
        textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
      ),
      onPressed: (){
        // onTap filter departed/arrived flights to be later
        setState(() {
          selected = label;
          //flightsFilter = !flightsFilter;
        });
        
      },
      child: Text(label),
    );
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final String dateStr = '2025-08-$dayStr';

    try {
      final responses = await Future.wait([
        dio.get(
          'https://www.hongkongairport.com/flightinfo-rest/rest/flights/past',
          queryParameters: {
            'date': dateStr,
            'lang': 'en',
            'cargo': false,
            'arrival': false,
          },
        ),
        dio.get(
          'https://www.hongkongairport.com/flightinfo-rest/rest/flights/past',
          queryParameters: {
            'date': dateStr,
            'lang': 'en',
            'cargo': false,
            'arrival': true,
          },
        ),
      ]);

      final departures = (responses[0].data as List)
          .map((item) => FlightDay.fromJson(item))
          .toList();

      final arrivals = (responses[1].data as List)
          .map((item) => FlightDay.fromJson(item))
          .toList();

      final allFlights = [...departures, ...arrivals];
      allFlights.sort((a, b) {
        final dateA = DateTime.parse(a.date);
        final dateB = DateTime.parse(b.date);

        if (dateA != dateB) {
          return dateA.compareTo(dateB);
        }
        final timeA = _parseTime(a.list.first.time);
        final timeB = _parseTime(b.list.first.time);
        return timeA.compareTo(timeB);
      });

      setState(() {
        _flights = allFlights;
      });
    } catch (e) {
      debugPrint('Ошибка загрузки данных: $e');
    }
  }

  DateTime _parseTime(String time) {
    final parts = time.split(':');
    return DateTime(0, 1, 1, int.parse(parts[0]), int.parse(parts[1]));
  }

  int getTotalItemCount(List<FlightDay> flights) {
    int total = 0;
    for (var day in flights) {
      total += day.list.length;
    }
    return total;
  }

  String getDisplayStatus(String status) {
    if (status.startsWith('Dep')) {
      return 'Departed';
    }
    else if(status.startsWith('At')){
      return 'At Gate';
    }
    return status;
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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
          if (_flights.isEmpty)
            SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                int offset = index;

                for (var day in _flights) {
                  if (offset < day.list.length) {
                    final flight = day.list[offset];

                    final flightNumbers = flight.flight.map((f) => f.no).toList();
                    final airlines = flight.flight.map((f) => f.airline).toList();

                    return FlightsTile(
                      isArrival: day.arrival,
                      date: day.date,
                      time: flight.time,
                      status: getDisplayStatus(flight.status),
                      destination: (flight.destination?.isNotEmpty ?? false) ? flight.destination![0] : '',
                      origin: (flight.origin?.isNotEmpty ?? false) ? flight.origin![0] : '',
                      terminal: flight.terminal ?? '',
                      aisle: flight.aisle ?? '',
                      gate: flight.gate ?? '',
                      baggage: flight.baggage ?? '',
                      hall: flight.hall ?? '',
                      stand: flight.stand ?? '',
                      flightNumbers: flightNumbers,
                      airlines: airlines,
                    );
                  } else {
                    offset -= day.list.length;
                  }
                }

                return const SizedBox.shrink();
              },
              childCount: getTotalItemCount(_flights),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 60),
              child: Text('Flight information is subject to changes. Please be reminded to check with your airlines for the latest flight details', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
            ),
          ),
          //SliverFillRemaining(),
        ],
      ),
    );
  }
}