// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Landmark _$LandmarkFromJson(Map<String, dynamic> json) {
  return Landmark(
      id: json['id'] as int,
      name: json['name'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      park: json['park'] as String,
      imageName: json['imageName'] as String,
      isFeatured: json['isFeatured'] as bool,
      isFavorite: json['isFavorite'] as bool,
      category: json['category'] as String,
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LandmarkToJson(Landmark instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': instance.state,
      'city': instance.city,
      'park': instance.park,
      'imageName': instance.imageName,
      'coordinates': instance.coordinates,
      'category': instance.category,
      'isFavorite': instance.isFavorite,
      'isFeatured': instance.isFeatured
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(
      longitude: (json['longitude'] as num)?.toDouble(),
      latitude: (json['latitude'] as num)?.toDouble());
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude
    };
