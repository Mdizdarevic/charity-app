// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sight _$SightFromJson(Map<String, dynamic> json) => Sight(
  (json['id'] as num).toInt(),
  json['title'] as String,
  json['description'] as String,
  json['address'] as String,
  (json['lat'] as num).toDouble(),
  (json['lng'] as num).toDouble(),
  (json['rating'] as num).toInt(),
  json['imageUrl'] as String,
);

Map<String, dynamic> _$SightToJson(Sight instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'address': instance.address,
  'lat': instance.lat,
  'lng': instance.lng,
  'rating': instance.rating,
  'imageUrl': instance.imageUrl,
};