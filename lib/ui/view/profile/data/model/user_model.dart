import 'package:objectbox/objectbox.dart';

@Entity()
class UserEntity {
  @Id()
  int id = 0; // ObjectBox internal ID

  String email;
  String password;
  String token;
  String message;
  String userId;
  String totalTrip;

  UserEntity({
    this.id = 0,
    required this.email,
    required this.password,
    required this.token,
    required this.message,
    required this.userId,
    required this.totalTrip,
  });

  // Convert from API model
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      token: json['token'] ?? '',
      message: json['message'] ?? '',
      userId: json['id']?.toString() ?? '',
      totalTrip: json['total_trips']?.toString() ?? '0',
    );
  }

  // Convert to Map (e.g., for debugging or re-upload)
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'token': token,
    'message': message,
    'id': userId,
    'total_trips': totalTrip,
  };
}
