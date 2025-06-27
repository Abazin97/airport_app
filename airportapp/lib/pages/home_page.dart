import 'dart:async';

import 'package:airportapp/components/cell.dart';
import 'package:airportapp/components/cell_item.dart';
import 'package:airportapp/components/nav_provider.dart';
import 'package:airportapp/models/weather_model.dart';
import 'package:airportapp/pages/inbox_page.dart';
import 'package:airportapp/pages/track_my_bag.dart';
import 'package:airportapp/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> image = [
    'lib/images/world_of_icecream.jpg',
    'lib/images/early_summer_delights.jpg',
    'lib/images/baggage-porter-service.jpg',
    'lib/images/meet&assist.png',
    'lib/images/vintage_buggy.jpg',
  ];

  List<String> tileLinks = [
    'https://hkairportshop.com/eshop_en/icecream25',
    'https://hkairportshop.com/eshop_en/summerdelights25',
    'https://www.hkairportbooking.com/en/ppg00015.html',
    'https://www.hkairportbooking.com/en/ppg00016.html',
    'https://www.hkairportbooking.com/en/ppg00013.html',
  ];

  List<String> tileNames = [
    'World of Ice Cream',
    'HKairportShop.com',
    'Porter Service',
    'Meet and Assist with Add-on Services',
    'Airport Vintage Buggy Service',
  ];


  final PageController _pageController = PageController();
  int _currentPage = 0;


  //get weather info via API
  final _weatherService = WeatherService(apikey: 'db0ae1107e1964b2e9cdb5a192714471');
  Weather? _weather;
  bool temperatureIsExist = false;

  Map<String, IconData> iconsMap = {
   'cloud': Icons.cloud,
   'rainy': Icons.cloudy_snowing,
   'thunderstorm': Icons.thunderstorm,
   'sunny': Icons.sunny,
  };

  _fetchWeather()async{
    try{
      final weather = await _weatherService.getWeather('Hong Kong');
      setState(() {
        _weather = weather;
      });
    }
    catch(e){
      debugPrint(e as String);
    }
  }

  //set weather condition icon
  String getWeatherCondition(String? mainCondition){
    if (mainCondition != null) {
      temperatureIsExist == true;
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

//loading weather info & starting timer
  @override
  void initState() {
    super.initState();
    _fetchWeather();
    Future.delayed(Duration(seconds: 1),() {
      Timer.periodic(Duration(seconds: 4), (Timer timer) {
        if (_currentPage < image.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        leading: null,
        actions: [Container()],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[600],
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Text(
            'Welcome to My HKG',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50), 
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(left: 30, right: 0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text('Hong Kong', style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text(
                        ' | ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Icon(iconsMap[getWeatherCondition(_weather?.mainCondition)], color: Colors.white, size: 14,),
                      Text(temperatureIsExist ? '  -'  : '  ${_weather?.temperature.round()}°C', style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
                ),
                Builder(
                  builder: (context){
                    return IconButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => TrackMyBag()
                          )
                        );
                      }, 
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Colors.white
                      )
                    );
                  }
                ),
                SizedBox(width: 10),
                Builder(
                  builder: (context){
                    return IconButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => InboxPage()
                          )
                        );
                      }, 
                      icon: Icon(
                        Icons.mail_outline,
                        color: Colors.white
                      )
                    );
                  }
                ),
                SizedBox(width: 10),
                Builder(
                  builder: (context){
                    return IconButton(
                      onPressed: (){
                        Scaffold.of(context).openEndDrawer();
                      }, 
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ), 
                    );
                  }
                ),
              ]
            ),
          )   
        )
      ), 
      //right panel
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        width: 550,
        backgroundColor: Colors.white,
        elevation: 0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 90,
              child: DrawerHeader(
                decoration: BoxDecoration(    
                  color: Colors.blue[800],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'More',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                //search bar
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        context.read<NavProvider>().pageIndex = 1;
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(12),
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
                  ),
                  //qr-code button
                  Builder(
                    builder: (context){
                      return IconButton(
                        onPressed: (){
                          
                        }, 
                        icon: Icon(
                          Icons.document_scanner,
                          color: Colors.white,
                        )
                      );
                    }
                  ),
                ],
              ),
              //tiles
              const SizedBox(height: 30),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    final items = CellItem.getCellList();
                    return Cell(item: items[index]);
                  }
                ),
              ),
              //text
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('What`s new?', 
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                ),
              ),
              // bigger tiles
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: SizedBox(
                  height: 190,
                  child: PageView.builder(
                    itemCount: image.length,
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: () async {
                          final _url = Uri.parse(tileLinks[index]);
                          await launchUrl(_url, mode: LaunchMode.inAppWebView);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 40),
                              height: 150,
                              width: 370,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey[200],
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    image[index],
                                    fit: BoxFit.fill,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black.withValues(alpha: 0.4)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('${index+1}/5', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                                          Icon(Icons.rectangle_rounded, color: Colors.white)
                                        ],
                                      ),
                                    ),
                                  )
                                ]
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(tileNames[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                          ],
                        ),
                      );
                    }
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 15),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Top picks for you', 
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 15),
                child: SizedBox(
                  height: 90,
                  child: ListView.builder(
                    itemCount: tileLinks.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          
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
              ),
            ],
          ),
        ]
      )
    );
  }
}