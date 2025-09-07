import 'package:airportapp/components/flights_screen/calendar_cell.dart';
import 'package:airportapp/data/database.dart';
import 'package:airportapp/models/flightDay.dart';
import 'package:airportapp/components/flights_screen/flights_tile.dart';
import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/models/flightInfo.dart';
import 'package:airportapp/pages/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class FlightsPage extends StatefulWidget {
  final bool autofocus;
  const FlightsPage({super.key, this.autofocus = false});

  @override
  State<FlightsPage> createState() => _FlightsPageState();
}


// model for 1 item(exactly flight)
class FlightEntry {
  final bool isArrival;
  final String date;
  final FlightInfo flight;

  FlightEntry({
    required this.isArrival,
    required this.date,
    required this.flight,
  });
}


class _FlightsPageState extends State<FlightsPage> {
  List<FlightEntry> searchItems = [];
  List<FlightEntry> _flights = [];
  List<FlightEntry> _filteredFlights = [];
  List<String> queryResults = [];
  final dio = Dio();
  String selected = 'All';
  String _searchQuery = "";
  int selectedIndex = 1;
  bool flightsFilter = false;
  bool isLoading = false;
  bool isSearching = false;
  DateTime today = DateTime.now();
  String dateStr = DateFormat('yyyy-MM-dd').format(DateTime.now());

  
  Widget flightsButton(String label){
    bool isSelected = selected == label;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(100, 35),
        backgroundColor: isSelected ? Colors.yellow : Colors.white,
        textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
      ),
      onPressed: (){
        // onTap filter departed/arrived flights
        setState(() {
          selected = label;
          _applyFilter();
        });
        
      },
      child: Text(label),
    );
  }

  @override
  void initState() {
    fetchData(dateStr);
    super.initState();
  }

  List<FlightEntry> get flightToShow {
  if (_searchQuery.isEmpty) {
    return _filteredFlights;
  } else {
    return searchFlight(_searchQuery)
        .where((e) => _filteredFlights.contains(e))
        .toList();
  }
}

  void _applyFilter() {
    setState(() {
      if (selected == 'All') {
        _filteredFlights = List.from(_flights);
      } else if (selected == 'Departures') {
        _filteredFlights = _flights.where((f) => f.isArrival == false).toList();
      } else if (selected == 'Arrivals') {
        _filteredFlights = _flights.where((f) => f.isArrival == true).toList();
      }
    });
  }

  void _setLoading(bool value){
    setState(() {
      isLoading = value;
    });
  }

  // getting data from API
  Future<void> fetchData(String dateStr) async {
    _setLoading(true);
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

      final List<FlightEntry> allFlights = [];
      for (var day in (responses[0].data as List).map((e) => FlightDay.fromJson(e))) {
        for (var f in day.list) {
          allFlights.add(FlightEntry(
            isArrival: false,
            date: day.date,
            flight: f,
          ));
        }
      }
      for (var day in (responses[1].data as List).map((e) => FlightDay.fromJson(e))) {
        for (var f in day.list) {
          allFlights.add(FlightEntry(
            isArrival: true,
            date: day.date,
            flight: f,
          ));
        }
      }

      allFlights.sort((a, b) {
        final dateA = DateTime.parse(a.date);
        final dateB = DateTime.parse(b.date);

        if (dateA != dateB) return dateA.compareTo(dateB);

        final timeA = _parseTime(a.flight.time);
        final timeB = _parseTime(b.flight.time);
        return timeA.compareTo(timeB);
      });

      setState(() {
        _flights = allFlights;
        _applyFilter();
      });
      _setLoading(false);
    } catch (e) {
      debugPrint('Ошибка загрузки данных: $e');
    }
  }

  // filter by date 
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

  // status modificator
  String getDisplayStatus(String? status) {
    if (status == null) {
      return '';
    }
    else if (status.startsWith('Dep')) {
      return 'Departed';
    }
    else if(status.startsWith('At')){
      return 'At Gate';
    }
    return status;
  }

  List<String> displayAnother(String query){
    if (query.isEmpty) return [];
    return Database.airlineCodes.entries
      .where((entry) =>
          entry.key.toLowerCase().contains(query.toLowerCase()) ||
          entry.value.toLowerCase().contains(query.toLowerCase()))
      .map((entry) => "${entry.key}: ${entry.value}")
      .toList();
  }

  // dropdown menu filter
  List<String> displayQuery(String query, List<FlightEntry> flights){
    List<String> queryData = [];

    return flights.expand((e) {
      if (e.flight.destination?.any((d) => d.contains(query)) ?? false){
        queryData.addAll(e.flight.destination!.where((d) => d.contains(query.toLowerCase())));
      }
      if (e.flight.origin?.any((o) => o.contains(query)) ?? false){
        queryData.addAll(e.flight.origin!.where((d) => d.contains(query.toLowerCase())));
      }
      final matchingFlights = e.flight.flight.where((e){
        final no = e.no.toLowerCase().replaceAll(' ', '');
        final airline = e.airline.toLowerCase();
        final airlineName = (Database.airlineCodes[e.airline] ?? '').toLowerCase();
        return no.contains(query.toLowerCase()) ||
        airline == query ||
        airlineName.contains(query);
      });
      return queryData;
    }).toList();
    // return flights.expand((el) => el.flight.flight).where((e){
    //   final no = e.no.toLowerCase().replaceAll(' ', '');
    //   final airline = e.airline.toLowerCase();
    //   final airlineName = (Database.airlineCodes[e.airline] ?? '').toLowerCase();

    //   return no.contains(query) ||
    //   airline == query ||
    //   airlineName.contains(query);
    // }).map((e) => e.no).toList();
    
  }


  List<FlightEntry> searchFlight(String query) { 
    if (query.isEmpty) return _flights; 
    final lowerQuery = query.toLowerCase();
    return _flights.where((e) {
      final destination = e.flight.destination ?? [];
      final origin = e.flight.origin ?? [];
      final destCode = destination.join('').toLowerCase();
      final origCode = origin.join('').toLowerCase();
      final destStr = (Database.airportCodes[destination.join('')] ?? '').toLowerCase();
      final origStr = (Database.airportCodes[origin.join(' ')] ?? '').toLowerCase();
      
      return e.flight.flight.any((f) {
        final no = f.no.toLowerCase().replaceAll(' ', ''); 
        final airline = f.airline.toLowerCase(); 
        final airlineName = (Database.airlineCodes[f.airline] ?? '').toLowerCase();

        return no.startsWith(lowerQuery) ||
          no.contains(lowerQuery) || 
          airline.contains(lowerQuery) || 
          airlineName.contains(lowerQuery) ||
          destination.contains(lowerQuery) ||
          destCode.contains(lowerQuery) ||
          origCode.contains(lowerQuery) ||
          destStr.contains(lowerQuery) ||
          origStr.contains(lowerQuery);
      }); 
    }).toList(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Stack(
        children: [
          CustomScrollView(
            physics: isSearching
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                //pinned: true,
                floating: true,
                expandedHeight: 400,
                backgroundColor: Colors.blue[800],
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
                                        autofocus: widget.autofocus,
                                        onChanged: (value) {
                                          setState(() {
                                            isSearching = value.isNotEmpty;
                                            _searchQuery = value;
                                            searchItems = searchFlight(value);
                                            queryResults = displayQuery(_searchQuery, searchItems);
                                          });                                   
                                        },
                                        onSubmitted: (value) {
                                          setState(() {
                                            isSearching = false;
                                          });
                                        },
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
                        SizedBox(
                          height: 70,
                          child: ListView.builder(
                            itemCount: 16,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CalendarCell(
                                index: index,
                                isSelected: selectedIndex == index,
                                onTap: () async{
                                  final selectedDate = DateFormat('yyyy-MM-dd').format(today.add(Duration(days: index - 1)),);
                                  await fetchData(selectedDate);
                                  setState(() {
                                    selectedIndex = index;
                                    searchItems = searchFlight(_searchQuery);
                                  });
                                },
                                date: today.add(Duration(days: index - 1)),
                              );
                            },
                          ),
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
                            itemCount: Database.tileLinksFlights.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  final _url = Uri.parse(Database.tileLinksFlights[index]);
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
                                    Database.imageHome[index],
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
              if (isLoading)
                SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                )
              else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final flightEntry = flightToShow[index];
                    final flight = flightEntry.flight;
          
                    final flightNumbers = flight.flight.map((f) => f.no).toList();
                    final airlines = flight.flight.map((f) => f.airline).toList();
          
                    return FlightsTile(
                      isArrival: flightEntry.isArrival,
                      date: flightEntry.date,
                      time: flight.time,
                      status: getDisplayStatus(flight.status),
                      destination: (flight.destination?.isNotEmpty ?? false) ? flight.destination! : [],
                      origin: (flight.origin?.isNotEmpty ?? false) ? flight.origin! : [],
                      terminal: flight.terminal ?? '',
                      aisle: flight.aisle ?? '',
                      gate: flight.gate ?? '',
                      baggage: flight.baggage ?? '',
                      hall: flight.hall ?? '',
                      stand: flight.stand ?? '',
                      flightNumbers: flightNumbers,
                      airlines: airlines,
                    );
                  },
                  childCount: flightToShow.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 60),
                  child: Text('Flight information is subject to changes. Please be reminded to check with your airlines for the latest flight details', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
                ),
              ),
            ],
          ),
          if (isSearching)
            Positioned.fill(
              top: kToolbarHeight + MediaQuery.of(context).padding.top + 80,
              child: Container(
                color: Colors.white,
                child: _searchListView(),
              ),
            ),
        ]
      ),
    );
  }

  // dropdown search menu
  Widget _searchListView() {
    return ListView.builder(
      itemCount: queryResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(queryResults[index]),
        );
      },
    );
  }
}