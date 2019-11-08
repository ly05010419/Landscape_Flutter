import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Landmark {
  final int id;
  final String name;
  final String state;
  final String city;
  final String park;
  final String imageName;
  final Coordinates coordinates;
  final String category;
  final bool isFavorite;
  final bool isFeatured;

  Landmark(
      {this.id,
      this.name,
      this.state,
      this.city,
      this.park,
      this.imageName,
      this.isFeatured,
      this.isFavorite,
      this.category,
      this.coordinates});

  factory Landmark.fromJson(Map<String, dynamic> json) =>
      _$LandmarkFromJson(json);

  Map<String, dynamic> toJson() => _$LandmarkToJson(this);

  String getImageName() {
    return "assets/images/" + imageName + ".jpg";
  }
}

@JsonSerializable()
class Coordinates {
  final double longitude;
  final double latitude;

  Coordinates({this.longitude, this.latitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
