import 'dart:async';
import 'package:airportapp/components/home_screen/cell.dart';
import 'package:airportapp/components/home_screen/cell_item.dart';
import 'package:airportapp/components/home_screen/static_tile.dart';
import 'package:airportapp/components/home_screen/static_tile_item.dart';
import 'package:airportapp/providers/nav_provider.dart';
import 'package:airportapp/data/database.dart';
import 'package:airportapp/models/weather_model.dart';
import 'package:airportapp/pages/track_my_bag.dart';
import 'package:airportapp/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';



class HomePage extends StatefulWidget {
  final bool isDrawer;
  const HomePage({super.key, this.isDrawer = false});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;


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

  void _fetchWeather()async{
    try{
      final weather = await _weatherService.getWeather('Hong Kong');
      if(!mounted) return;
      setState(() {
        _weather = weather;
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

//loading weather info & starting timer
  @override
  void initState() {
    super.initState();
    _fetchWeather();
    Future.delayed(Duration(seconds: 1),() {
      if (!mounted) return;
      _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
        if (_currentPage < Database.imageHome.length - 1) {
            _currentPage++;
          } else {
            _currentPage = 0;
          }
          if (mounted && _pageController.hasClients){
            _pageController.animateToPage(
              _currentPage,
              duration: Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          }
        });
    });
  }

  void stopAutoScroll(){
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        leading: null,
        actions: [Container()],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[800],
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            'Welcome to My HKG',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30
            ),
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50), 
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(left: 15, right: 0),
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
                      Text(temperatureIsExist ? '  ${_weather?.temperature.round()}°C' : ' -', style: TextStyle(color: Colors.white, fontSize: 16))
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
                            fullscreenDialog: true,
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
                        Provider.of<NavProvider>(context, listen: false).pageIndex = 4;
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
                        Provider.of<NavProvider>(context, listen: false).pageIndex = 7;
                        //Scaffold.of(context).openEndDrawer();
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
      //endDrawer: CustomDrawer(),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                //search bar
                children: [
                  Flexible(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onTap: () {
                                context.read<NavProvider>().openWithSearchFocus();
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
              //small tiles
              const SizedBox(height: 40),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    final items1 = CellItem.getCellList();
                    return Cell(item: items1[index]);
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
              // animated tiles
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: SizedBox(
                  height: 190,
                  child: NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      if(notification.direction != ScrollDirection.idle){
                        stopAutoScroll();
                      }
                      return false;
                    },
                    child: PageView.builder(
                      itemCount: Database.imageHome.length,
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: () async {
                            final url = Uri.parse(Database.tileLinksHome[index]);
                            await launchUrl(url, mode: LaunchMode.inAppWebView);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 40),
                                height: 140,
                                width: 320,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey[200],
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.asset(
                                      Database.imageHome[index],
                                      fit: BoxFit.cover,
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
                                            Text('${index+1}/6', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                                            Icon(Icons.rectangle_rounded, color: Colors.white)
                                          ],
                                        ),
                                      ),
                                    )
                                  ]
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(Database.tileNames[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                            ],
                          ),
                        );
                      }
                    ),
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
              //static tiles
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 15),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: StaticTileItem.getTileList().length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final items2 = StaticTileItem.getTileList();
                      return StaticTile(item: items2[index]);
                    },
                  ),
                ),
              ),
              SizedBox(height: 50)
            ],
          ),
        ]
      )
    );
  }
}