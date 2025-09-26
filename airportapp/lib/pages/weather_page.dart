import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherPage extends StatelessWidget {
  final String city;
  final String tempToday;
  final IconData? tempTodayIcon;
  WeatherPage({
    super.key, 
    required this.city, 
    required this.tempToday,
    required this.tempTodayIcon
  });

  final DateTime today = DateTime.now();
  final String dateStr = DateFormat('EEEE | dd MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )
        )
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 70),
                          child: Text(city, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),),
                        ),
                      Text('$dateStr (Today)', style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(tempTodayIcon, size: 60, color: Colors.white,),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Text(tempToday, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70, color: Colors.white),),
              ),
              Row(children: [
                Row(children: [
                  Icon(Icons.water_drop_outlined, color: Colors.white,),
                  Text('-', style: TextStyle(color: Colors.white))
                ],),
                SizedBox(width: 40),
                Row(children: [
                  Icon(Icons.air, color: Colors.white,),
                  Text('-', style: TextStyle(color: Colors.white),)
                ],)
              ],)
            ],
          ),
        )
      ],),
    );
  }
}