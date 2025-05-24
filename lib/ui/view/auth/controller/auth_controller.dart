import 'package:get/get.dart';
import 'package:vehicle_rental_app/core/controller/base_controller.dart';
import 'package:vehicle_rental_app/helper/ui_helper/dialog_helper.dart';

class AuthController extends GetxController implements GetxService, BaseController {


  @override
  hideLoading() {
    DialogHelper.hideLoading();
  }


  @override
  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }
}
