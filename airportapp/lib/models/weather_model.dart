class Weather{
  final double temperature;
  final String mainCondition;
  final double speed;
  final double humidity;

  Weather({
    required this.temperature,
    required this.mainCondition,
    required this.speed,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      temperature: json['main']['temp'].toDouble(), 
      mainCondition: json['weather'][0]['main'],
      speed: json['wind']['speed'],
      humidity: json['main']['humidity'].toDouble(),
    );
  }
}