import 'package:airportapp/models/flightInfo.dart';
import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';


class Database {
  final exdata = [
    {
      "date": "2025-05-25",
      "arrival": false,
      "cargo": false,
      "list": [
        {
          "time": "23:55",
          "flight": [
            {
              "no": "CX 101",
              "airline": "CPA"
            },
            {
              "no": "AY 5093",
              "airline": "FIN"
            }
          ],
          "status": "Dep 00:07 (26/05/2025)",
          "statusCode": null,
          "destination": [
            "SYD"
          ],
          "terminal": "T1",
          "aisle": "A",
          "gate": "36"
        },
        {
          "time": "23:55",
          "flight": [
            {
              "no": "CX 289",
              "airline": "CPA"
            },
            {
              "no": "LH 7015",
              "airline": "DLH"
            }
          ],
          "status": "Dep 00:23 (26/05/2025)",
          "statusCode": null,
          "destination": [
            "FRA"
          ],
          "terminal": "T1",
          "aisle": "A",
          "gate": "50"
        }
      ]
    },
  ];
  
  final dio = Dio();
      
  Future<List<FlightInfo>> fetchData() async{

    var response = await dio.get('https://www.hongkongairport.com/flightinfo-rest/rest/flights/past?date=2025-08-09&lang=en&cargo=false&arrival=true');
    
    debugPrint(response.data.toString());
    
    if (response.statusCode == 200){
      final flightsJson = response.data;
      return (flightsJson as List).map((item) => FlightInfo.fromJson(item)).toList();
    }
    return [];
  }
}

 

/* class MainCategory{
  List<DayLight> allData;

  MainCategory({required this.allData});
  
  factory MainCategory.fromJson(List<Map<String, Object>> json){
    return MainCategory(allData: json.map((e) => DayLight.fromJson(e)).toList());
  }
}

class DayLight{
  String? date;
  List<Flight>? list;

  DayLight({this.date, this.list});

  DayLight.fromJson(Map<String, Object> json){
    date = json['date'] as String;
    if(json['list'] != null){
      list = <Flight>[];
      (json['list'] as List).forEach((e) {
        list!.add(Flight.fromJson(e));
      });
    }
  }
}

class Flight{
  String? time;
  String? status;
  String? statusCode;
  String? terminal;
  String? aisle;
  String? gate;
  List<String>? dest;
  List<FlightData>? flight;

  Flight({this.time, this.status, this.statusCode, this.terminal, this.aisle, this.gate, this.dest, this.flight});

  Flight.fromJson(Map<String, dynamic> json){
    time = json['time'];
    status = json['status'];
    statusCode = json['statusCode'];
    terminal = json['terminal'];
    aisle = json['aisle'];
    gate = json['gate'];
    if(json['flight'] != null){
      flight = <FlightData>[];
      (json['flight'] as List).forEach((e) {
        flight!.add(FlightData.fromJson(e));
      });
    }
    if (json['destination'] != null) {
      dest = List<String>.from(json['destination']);
    }
  }
}

class FlightData{
  String? flightNumber;
  String? airlineCode;

  FlightData({this.flightNumber, this.airlineCode});
  FlightData.fromJson(Map<String, dynamic> json){
    flightNumber = json['no'];
    airlineCode = json['airline'];
  }
} */