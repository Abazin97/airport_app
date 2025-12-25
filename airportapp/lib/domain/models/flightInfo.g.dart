// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flightInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightInfo _$FlightInfoFromJson(Map<String, dynamic> json) => FlightInfo(
  time: json['time'] as String,
  flight: (json['flight'] as List<dynamic>)
      .map((e) => FlightNumber.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as String?,
  destination: (json['destination'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  origin: (json['origin'] as List<dynamic>?)?.map((e) => e as String).toList(),
  terminal: json['terminal'] as String?,
  aisle: json['aisle'] as String?,
  gate: json['gate'] as String?,
  baggage: json['baggage'] as String?,
  hall: json['hall'] as String?,
  stand: json['stand'] as String?,
);

Map<String, dynamic> _$FlightInfoToJson(FlightInfo instance) =>
    <String, dynamic>{
      'time': instance.time,
      'flight': instance.flight.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'destination': instance.destination,
      'origin': instance.origin,
      'terminal': instance.terminal,
      'aisle': instance.aisle,
      'gate': instance.gate,
      'baggage': instance.baggage,
      'hall': instance.hall,
      'stand': instance.stand,
    };
