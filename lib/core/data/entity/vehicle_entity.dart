import 'package:objectbox/objectbox.dart';
import 'package:vehicle_rental_app/core/data/entity/location_entity.dart';

@Entity()
class VehicleEntity {
  @Id()
  int id = 0;

  String name;
  String type;
  String? status;
  String? image;
  int? battery;
  int? costPerMinute;
  String? createAt;
  String? vehicleId;

  final ToOne<LocationEntity> location = ToOne<LocationEntity>();

  VehicleEntity({this.id = 0, required this.name, required this.type, this.status, this.image, this.battery, this.costPerMinute, this.createAt, this.vehicleId});

  factory VehicleEntity.fromJson(Map<String, dynamic> json) {
    final vehicle = VehicleEntity(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      status: json['status'],
      image: json['image'],
      battery: json['battery'],
      costPerMinute: json['cost_per_minute'],
      createAt: json['createAt'],
      vehicleId: json['id'],
    );

    if (json['location'] != null) {
      vehicle.location.target = LocationEntity.fromJson(json['location']);
    }

    return vehicle;
  }


  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'type': type,
    'status': status,
    'image': image,
    'battery': battery,
    'cost_per_minute': costPerMinute,
    'createAt': createAt,
  };
}
