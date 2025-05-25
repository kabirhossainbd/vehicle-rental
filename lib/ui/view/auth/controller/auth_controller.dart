import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_app/core/controller/base_controller.dart';
import 'package:vehicle_rental_app/core/data/model/response_model.dart';
import 'package:vehicle_rental_app/helper/ui_helper/dialog_helper.dart';
import 'package:vehicle_rental_app/ui/view/auth/data/repo/auth_repo.dart';
import 'package:vehicle_rental_app/ui/view/home/controller/home_controller.dart';
import 'package:vehicle_rental_app/ui/view/profile/controller/profile_controller.dart';

class AuthController extends GetxController implements GetxService, BaseController {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isNetworkConnected = true;
  bool get isNetworkConnected => _isNetworkConnected;

  void setIsNetworkConnected(bool event) {
    _isNetworkConnected = event;
    update();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  Future<ResponseModel> loginBody(String email, String password) async {
    if (!isNetworkConnected) {
      DialogHelper.showNoInternetDialog();
      return ResponseModel(false, 'No Internet');
    }
    _isLoading = true;
    update();
    Response response = await authRepo.login(email, password);
    ResponseModel responseModel;
    if (response.statusCode == 201) {
      authRepo.saveUserToken(response.body['token']);
      saveUserId(response.body['id']);
      responseModel = ResponseModel(true, response.body['message']);
    } else {
      debugPrint('-----------error::${response.body}');
      responseModel = ResponseModel(false, response.body);
    }

    _isLoading = false;
    update();
    return responseModel;
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }


  final home = Get.find<HomeController>();
  final profile = Get.find<ProfileController>();
  Future<bool> clearSharedData() async {
    home.clearVehicleCache();
    profile.clearProfileCache();
    return await authRepo.clearSharedData();
  }


  void saveUserId(String userId) {
    authRepo.saveUserId(userId);
  }

  String getUserId() {
    return authRepo.getUserId();
  }
  @override
  hideLoading() {
    DialogHelper.hideLoading();
  }


  @override
  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }
}
