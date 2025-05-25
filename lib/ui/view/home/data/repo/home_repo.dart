import 'package:get/get.dart';
import 'package:vehicle_rental_app/common/data/datasource/remote/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_rental_app/util/key.dart';

class HomeRepo {
  final ApiClient apiSource;
  final SharedPreferences sharedPreferences;
  HomeRepo({required this.apiSource, required this.sharedPreferences});

  Future<Response> getVehicleList() async {
    return apiSource.getData(ShareKey.vehiclesUri);
  }

  Future<Response> getVehicleDetails(String carId) async {
    return apiSource.getData('${ShareKey.vehiclesUri}/$carId');
  }

}
