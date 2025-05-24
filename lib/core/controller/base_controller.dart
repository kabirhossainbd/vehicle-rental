import 'package:vehicle_rental_app/helper/ui_helper/dialog_helper.dart';

class BaseController {
  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }
  hideLoading() {
    DialogHelper.hideLoading();
  }
}
