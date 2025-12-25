import 'package:json_annotation/json_annotation.dart';

part 'flightNumber.g.dart';

@JsonSerializable()
class FlightNumber {
  final String no;
  final String airline;

  FlightNumber({
    required this.no,
    required this.airline,
  });

  factory FlightNumber.fromJson(Map<String, dynamic> json) => _$FlightNumberFromJson(json);
  Map<String, dynamic> toJson() => _$FlightNumberToJson(this);
}
