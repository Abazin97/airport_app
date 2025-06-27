
class FlightInfo {
  FlightInfo({
    required this.time,
    required this.status,
    required this.terminal,
    required this.aisle,
    required this.gate,
    required this.dest,
    required this.airline,
    required this.flightNo
  });

  final String time;
  final String status;
  final String terminal;
  final String aisle;
  final String gate;
  final String dest;
  final List<String> airline;
  final List<String> flightNo;

  factory FlightInfo.fromJson(Map<String, dynamic> json){
    return FlightInfo(
      time: json['time'],
      status: json['status'], 
      terminal: json['terminal'], 
      aisle: json['aisle'], 
      gate: json['gate'], 
      dest: json['destination'], 
      airline: json['airline'],
      flightNo: json['flightNo']);
  }
  

}
