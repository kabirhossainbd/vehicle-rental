// class VehicleModel {
//   String? name;
//   String? type;
//   String? status;
//   String? image;
//   int? battery;
//   Location? location;
//   int? costPerMinute;
//   String? createAt;
//   String? id;
//
//   VehicleModel({
//     this.name,
//     this.type,
//     this.status,
//     this.image,
//     this.battery,
//     this.location,
//     this.costPerMinute,
//     this.createAt,
//     this.id,
//   });
//
//   factory VehicleModel.fromJson(Map<String, dynamic> json) {
//     return VehicleModel(
//       name: json['name'],
//       type: json['type'],
//       status: json['status'],
//       image: json['image'],
//       battery: json['battery'],
//       location: json['location'] != null
//           ? Location.fromJson(json['location'])
//           : null,
//       costPerMinute: json['cost_per_minute'],
//       createAt: json['createAt'],
//       id: json['id'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'type': type,
//       'status': status,
//       'image': image,
//       'battery': battery,
//       'location': location?.toJson(),
//       'cost_per_minute': costPerMinute,
//       'createAt': createAt,
//       'id': id,
//     };
//   }
// }
//
// class Location {
//   double? lat;
//   double? lng;
//
//   Location({this.lat, this.lng});
//
//   factory Location.fromJson(Map<String, dynamic> json) {
//     return Location(
//       lat: (json['lat'] as num?)?.toDouble(),
//       lng: (json['lng'] as num?)?.toDouble(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'lat': lat,
//       'lng': lng,
//     };
//   }
// }
