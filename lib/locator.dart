import 'package:vehicle_rental_app/common/data/datasource/local/objectbox_database.dart';
import 'package:vehicle_rental_app/common/data/datasource/remote/api_client.dart';
import 'package:vehicle_rental_app/ui/view/auth/controller/auth_controller.dart';
import 'package:vehicle_rental_app/ui/view/auth/data/repo/auth_repo.dart';
import 'package:vehicle_rental_app/ui/view/home/controller/home_controller.dart';
import 'package:vehicle_rental_app/ui/view/home/data/repo/home_repo.dart';
import 'package:vehicle_rental_app/ui/view/profile/controller/profile_controller.dart';
import 'package:vehicle_rental_app/ui/view/profile/data/repo/profile_repo.dart';
import 'package:vehicle_rental_app/util/key.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<Map<String, Map<String, String>>> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  final store = await DatabaseService.getStore();

  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => store, fenix: true);
  //Core
  Get.lazyPut(() => ApiClient(appBaseUrl: ShareKey.baseUrl,  sharedPreferences: Get.find()));


  // Repo
  Get.lazyPut(() => AuthRepo(apiSource: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => HomeRepo(apiSource: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => ProfileRepo(apiSource: Get.find()));


  // Controller
  Get.lazyPut(() => HomeController(Get.find(),homeRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => ProfileController(Get.find(),profileRepo: Get.find()));

  return {};
}
