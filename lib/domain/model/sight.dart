import 'package:json_annotation/json_annotation.dart';

part 'sight.g.dart';

@JsonSerializable()
class Sight {
  final int id;
  final String title;
  final String description;
  final String address;
  final double lat;
  final double lng;
  final int rating;
  final String imageUrl;

  Sight(
      this.id,
      this.title,
      this.description,
      this.address,
      this.lat,
      this.lng,
      this.rating,
      this.imageUrl,
      );

  // from JSON
  factory Sight.fromJson(Map<String, dynamic> json) => _$SightFromJson(json);

  // to JSON
  Map<String, dynamic> toJson() => _$SightToJson(this);
}