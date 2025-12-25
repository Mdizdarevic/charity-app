import '../../domain/model/charity.dart';

class CharityDto {
  final String name;
  final String ein;
  final String description;
  final String logoUrl;
  final String profileUrl;
  final bool isDisbursable;
  final String location;
  final String causeCategory;

  CharityDto({
    required this.name,
    required this.ein,
    required this.description,
    required this.logoUrl,
    required this.profileUrl,
    required this.isDisbursable,
    required this.location,
    required this.causeCategory,
  });

  factory CharityDto.fromJson(Map<String, dynamic> json) {
    return CharityDto(
      name: json['name'] ?? 'Unknown Name',
      ein: json['ein'] ?? 'N/A',
      description: json['description'] ?? '',
      logoUrl: json['logoUrl'] ?? '',
      profileUrl: json['profileUrl'] ?? '',
      isDisbursable: json['isDisbursable'] ?? false,
      location: json['location'] ?? 'Global',
      causeCategory: json['causeCategory'] ?? '',
    );
  }

  Charity toEntity() {
    return Charity(
      name: name,
      ein: ein,
      description: description,
      imageUrl: logoUrl,
      profileUrl: profileUrl,
      isVerified: isDisbursable,
      location: location,
        causeCategory: causeCategory
    );
  }
}