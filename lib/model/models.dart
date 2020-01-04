class Landmark {
  final String name;
  final String imageName;
  final String category;
  final double longitude;
  final double latitude;

  Landmark(
      {this.name,
      this.imageName,
      this.category,
      this.longitude,
      this.latitude});

  factory Landmark.fromJson(Map<String, dynamic> json) {
    return Landmark(
        name: json['name'] as String,
        imageName: json['imageName'] as String,
        category: json['category'] as String,
        longitude: (json['longitude'] as num)?.toDouble(),
        latitude: (json['latitude'] as num)?.toDouble());
  }
}
