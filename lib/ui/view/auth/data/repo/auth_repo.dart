import 'package:get/get.dart';
import 'package:vehicle_rental_app/common/data/datasource/remote/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_rental_app/util/key.dart';

class AuthRepo {
  final ApiClient apiSource;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiSource, required this.sharedPreferences});

  Future<Response> login(String email, String password) async {
    return  await apiSource.postData(ShareKey.loginUri,{"email": email, "password": password});
  }


  Future<bool> saveUserToken(String token) async {
    apiSource.token = token;
    apiSource.updateHeader(token);
    return await sharedPreferences.setString(ShareKey.token, token);
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(ShareKey.token);
  }

  // for  save userid
  Future<void> saveUserId(String userId) async {
    try {
      await sharedPreferences.setString(ShareKey.userId, userId);
    } catch (e) {
      rethrow;
    }
  }


  String getUserId() {
    return sharedPreferences.getString(ShareKey.userId) ?? "";
  }

  Future<bool> clearSharedData() async {
    sharedPreferences.remove(ShareKey.token);
    return true;
  }

}
