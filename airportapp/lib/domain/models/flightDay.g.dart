// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flightDay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightDay _$FlightDayFromJson(Map<String, dynamic> json) => FlightDay(
  date: json['date'] as String,
  arrival: json['arrival'] as bool,
  list: (json['list'] as List<dynamic>)
      .map((e) => FlightInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FlightDayToJson(FlightDay instance) => <String, dynamic>{
  'date': instance.date,
  'arrival': instance.arrival,
  'list': instance.list.map((e) => e.toJson()).toList(),
};
