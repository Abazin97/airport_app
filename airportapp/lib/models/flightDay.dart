import 'package:airportapp/models/flightInfo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flightDay.g.dart';

@JsonSerializable(explicitToJson: true)
class FlightDay {
  final String date;
  final bool arrival;
  final List<FlightInfo> list;

  FlightDay({
    required this.date,
    required this.arrival,
    required this.list,
  });

  factory FlightDay.fromJson(Map<String, dynamic> json) => _$FlightDayFromJson(json);
  Map<String, dynamic> toJson() => _$FlightDayToJson(this);
}
