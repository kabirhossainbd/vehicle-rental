import 'package:get/get.dart';
import 'package:vehicle_rental_app/common/data/datasource/remote/api_client.dart';
import 'package:vehicle_rental_app/util/key.dart';

class ProfileRepo {
  final ApiClient apiSource;
  ProfileRepo({required this.apiSource});

  Future<Response> getProfile(String userId) async {
    return  await apiSource.getData('${ShareKey.profileUri}/$userId');
  }

}
