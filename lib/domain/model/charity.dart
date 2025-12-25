class Charity {
  final String name;
  final String ein;
  final String description;
  final String imageUrl;
  final String location;
  final bool isVerified;
  final String profileUrl;
  final String causeCategory;

  Charity({
    required this.name,
    required this.ein,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.isVerified,
    required this.profileUrl,
    required this.causeCategory,
  });

  factory Charity.fromJson(Map<String, dynamic> json) {
    return Charity(
      name: json['name'] ?? '',
      ein: json['ein'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['logoUrl'] ?? '',
      location: json['location'] ?? '',
      profileUrl: json['profileUrl'] ?? '',
      isVerified: json['isDisbursable'] ?? false,
      causeCategory: json['causeCategory'] ?? '',
    );
  }
}