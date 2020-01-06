class Landmark {
  final String name;
  final String avatarName;
  final List<dynamic> images;

  final String category;
  final double longitude;
  final double latitude;

  Landmark(
      {this.name,
        this.avatarName,
      this.images,

      this.category,
      this.longitude,
      this.latitude});

  factory Landmark.fromJson(Map<String, dynamic> json) {
    return Landmark(
        name: json['name'] as String,
        avatarName: json['avatarName'] as String,

        images: json['images'] as List<dynamic>,
        category: json['category'] as String,
        longitude: (json['longitude'] as num)?.toDouble(),
        latitude: (json['latitude'] as num)?.toDouble());
  }
}





