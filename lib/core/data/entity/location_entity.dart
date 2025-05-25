import 'package:objectbox/objectbox.dart';

@Entity()
class LocationEntity {

  @Id()
  int id = 0;

  double? lat;
  double? lng;

  LocationEntity({this.lat, this.lng});

  factory LocationEntity.fromJson(Map<String, dynamic> json) {
    return LocationEntity(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}