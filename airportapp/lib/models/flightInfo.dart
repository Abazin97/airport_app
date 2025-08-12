import 'package:airportapp/models/flightNumber.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flightInfo.g.dart';

@JsonSerializable(explicitToJson: true)
class FlightInfo {
  final String time;
  final List<FlightNumber> flight;
  final String status;
  final List<String>? destination;
  final List<String>? origin;
  final String? terminal;
  final String? aisle;
  final String? gate;
  final String? baggage;
  final String? hall;
  final String? stand;

  FlightInfo({
    required this.time,
    required this.flight,
    required this.status,
    this.destination,
    this.origin,
    this.terminal,
    this.aisle,
    this.gate,
    this.baggage,
    this.hall,
    this.stand,
  });

  factory FlightInfo.fromJson(Map<String, dynamic> json) =>
      _$FlightInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FlightInfoToJson(this);
}
