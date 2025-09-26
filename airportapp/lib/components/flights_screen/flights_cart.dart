import 'package:airportapp/data/database.dart';
import 'package:airportapp/models/weather_model.dart';
import 'package:airportapp/pages/weather_page.dart';
import 'package:airportapp/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;


class FlightsCart extends StatefulWidget {
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
  State<FlightsCart> createState() => _FlightsCartState();
}

class _FlightsCartState extends State<FlightsCart> {
  String tempToday = '';
  String cityName = '';
  String cityTime = '';
  String hkTime = '';
  String timeDiffStr = '';
  late tz.TZDateTime cityDateTime;
  late tz.TZDateTime hkDateTime;
  final _weatherService = WeatherService(apikey: 'db0ae1107e1964b2e9cdb5a192714471');
  Weather? _weather;
  bool temperatureIsExist = false;
  IconData? tempTodayIcon;

  Map<String, IconData> iconsMap = {
   'cloud': Icons.cloud_outlined,
   'rainy': Icons.cloudy_snowing,
   'thunderstorm': Icons.thunderstorm_outlined,
   'sunny': Icons.wb_sunny_outlined,
  };

  void _fetchWeather()async{
    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
        tempTodayIcon = iconsMap[getWeatherCondition(_weather?.mainCondition)];
        tempToday = temperatureIsExist ? ' ${_weather!.temperature.round()}°C' : ' -';
      });
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  //set weather condition icon
  String getWeatherCondition(String? mainCondition){
    if (mainCondition != null) {
      temperatureIsExist = true;
    }else{
      return '';
    }

    switch(mainCondition.toLowerCase()){
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'cloud';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'rainy';
      case 'thunderstorm':
        return 'thunderstorm';
      case 'clear':
        return 'sunny';
      default: return '-';
    } 
  }

  Future<void> getTime() async {
    tzdata.initializeTimeZones();
    String tzName;
    if (widget.isArrival == false) {
      final city = Database.airportCodes[widget.destination![0]] ?? '';
      tzName = Database.cityTimeZones[city] ?? 'UTC';

      final hkLocation = tz.getLocation('Asia/Hong_Kong');
      hkDateTime = tz.TZDateTime.now(hkLocation);

      final location = tz.getLocation(tzName);
      cityDateTime = tz.TZDateTime.now(location);
    } else if (widget.isArrival == true) {
      final city = Database.airportCodes[widget.origin![0]] ?? '';
      tzName = Database.cityTimeZones[city] ?? 'UTC';

      final hkLocation = tz.getLocation(tzName);
      hkDateTime = tz.TZDateTime.now(hkLocation);

      final location = tz.getLocation('Asia/Hong_Kong');
      cityDateTime = tz.TZDateTime.now(location);
    } else {
      tzName = 'UTC';
    }

    hkTime = DateFormat('HH:mm').format(hkDateTime);
    cityTime = DateFormat('HH:mm').format(cityDateTime);

    getTimeDiffString();
  }


  void getTimeDiffString() {
    final nowUtc = DateTime.now().toUtc();
    final cityAtMoment = tz.TZDateTime.from(nowUtc, cityDateTime.location);
    final hkAtMoment = tz.TZDateTime.from(nowUtc, hkDateTime.location);
    final timeDiff = cityAtMoment.timeZoneOffset - hkAtMoment.timeZoneOffset;
    final hours = timeDiff.inHours.abs();
    final minutes = timeDiff.inMinutes.remainder(60).abs();
    final minutesFormatted = minutes.toString().padLeft(2, '0');
    if (timeDiff.isNegative) {
      timeDiffStr = '$hours:$minutesFormatted hours behind of';
    } 
    else if (timeDiff.inMinutes == 0) {
      timeDiffStr = 'Same time as';
    } else {
      timeDiffStr = '$hours:$minutesFormatted hours ahead of';
    }
  }

  @override
  void initState(){
    cityName = widget.isArrival 
      ? 'Hong Kong'
      : ((widget.destination!.length > 1)
        ? (Database.airportCodes[widget.destination?[1]] ?? widget.destination![1])
        : (Database.airportCodes[widget.destination?[0]] ?? widget.destination![0]));
    super.initState();
    getTime();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateFormatted = DateTime.parse(widget.date);
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
                      height: 400,
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
                            flex: 13,
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
                                            itemCount: widget.airlines.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index){
                                              final code = widget.airlines[index];
                                              final airlineName = Database.airlineCodes[code];
                                              final airlineLogo = Database.airlineLogos[code];
                                              final flightNo = widget.flightNumbers[index];
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
                                        Text(widget.isArrival ? 'From' : 'To', style: TextStyle(color: Colors.blue[900])),
                                        Text(
                                          widget.isArrival
                                              ? ((widget.origin?.isNotEmpty == true)
                                                  ? (Database.airportCodes[widget.origin?[0]] ?? widget.origin![0])
                                                  : "--")
                                              : ((widget.destination?.isNotEmpty == true)
                                                  ? ((widget.destination!.length > 1)
                                                      ? (Database.airportCodes[widget.destination?[1]] ?? widget.destination![1])
                                                      : (Database.airportCodes[widget.destination?[0]] ?? widget.destination![0]))
                                                  : "--"),
                                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900]),
                                        ),
                                        if ((widget.origin?.length ?? 0) > 1 || 
                                          (widget.destination?.length ?? 0) > 1)
                                            Row(
                                              children: [
                                                Text('via ', style: TextStyle(color: Colors.blue[900], fontSize: 12)),
                                                Text(
                                                  widget.isArrival
                                                    ? (Database.airportCodes[widget.origin?[1]] ?? widget.origin![1])
                                                    : (Database.airportCodes[widget.destination?[0]] ?? widget.destination![0]),
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
                                                Text(widget.isArrival ? 'Arrival Time' : 'Departure Time', style: TextStyle(color: Colors.blue[900])),
                                                Text(widget.time, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900]))
                                              ],
                                            ),
                                            SizedBox(width: 70),
                                            Column(
                                              children: [
                                                Text(widget.isArrival ? 'Baggage Reclaim' : 'Gate', style: TextStyle(color: Colors.blue[900])),
                                                Text(widget.isArrival ? (widget.baggage?.isNotEmpty == true ? widget.baggage! : '--') : (widget.gate?.isNotEmpty == true ? widget.gate! : '--'), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900]))
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
                                      Text(widget.status, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[900], fontSize: 18))
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
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text('Travel Tips of $cityName', 
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 100),
                    child: SizedBox(height: 150,child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        timeWidget(cityTime),
                        weatherWidget(cityName)
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

  Widget timeWidget(String time){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(Icons.more_time, color: Colors.blue[900],size: 30,),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            Text('$timeDiffStr ${widget.isArrival
            ? Database.airportCodes[widget.origin?[0]]
            : 'Hong Kong'}'
            )
          ],),
        ),
      ),
    );
  }

  Widget weatherWidget(String location){
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherPage(city: location, tempToday: tempToday, tempTodayIcon: tempTodayIcon))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.thermostat_auto, color: Colors.blue[900],size: 30,),
                Icon(Icons.arrow_forward_ios, color: Colors.blue[900],size: 30,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Today', style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),),
                Icon(tempTodayIcon, color: Colors.blue[900], size: 20,),
              ],),
            ),
            Text(tempToday, style: TextStyle(color: Colors.blue[900], fontSize: 20, fontWeight: FontWeight.bold)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Tomorrow'),
                Icon(Icons.thermostat_auto, color: Colors.blue[900], size: 20,)
            ],),
            Row(children: [
              Text(''),
              Text('')
            ],)
          ]),
        ),
      ),
    );
  }
}