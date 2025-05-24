import 'dart:convert';

import 'package:vehicle_rental_app/helper/ui_helper/overlay_helper.dart';
import 'package:vehicle_rental_app/ui/view/home/data/repo/home_repo.dart';
import 'package:vehicle_rental_app/ui/view/home/data/response/vehicle_model.dart';
import 'package:vehicle_rental_app/ui/view/home/screen/home_screen.dart';
import 'package:vehicle_rental_app/ui/view/profile/screen/profile_screen.dart';
import 'package:vehicle_rental_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController  implements GetxService {
  final HomeRepo homeRepo;
  HomeController({required this.homeRepo});


  PageController _pageController = PageController();
  PageController get pageController => _pageController;

  final List<ScreenModel> _screens = [
    ScreenModel(const HomeScreen(), 'Home', AllImages.home),
    ScreenModel(const ProfileScreen(), 'Profile', AllImages.profile),
  ];
  List<ScreenModel> get screen => _screens;

  initPageController(int page){
    _pageController = PageController(initialPage: page);
    setPageIndex(page);
  }


  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  setPageIndex(int index){
    _pageIndex = index;
  }
  void setPage(int pageIndex) {
    _pageController.jumpToPage(pageIndex);
    _pageIndex = pageIndex;
    update();
  }

  /// for network calling
  bool _isNetworkConnected = true;
  bool get isNetworkConnected  => _isNetworkConnected;

  void setIsNetworkConnected(bool event, BuildContext context) {
    if(event){
      OverlayManager.hideOverlay();
    }else{
      OverlayManager.showOverlay(context);
    }

    _isNetworkConnected = event;
    update();

  }


  String _currentScreen = '';
  String get currentScreen => _currentScreen;
  void setCurrentScreen(String screenName) {
    _currentScreen = screenName;
  }




  /// vehicle api call
  List<VehicleModel> _vehicleList = [];
  List<VehicleModel> get vehicleList => _vehicleList;

  bool _isVehicleEmpty = true;
  bool get isVehicleEmpty => _isVehicleEmpty;

  Future<void> getVehicleList(bool reload) async {
    Response response = await homeRepo.getVehicleList();

    if (response.statusCode == 200) {
      _vehicleList = (response.body as List).map((item) => VehicleModel.fromJson(item)).toList();
    } else {
      debugPrint('API error');
    }
    _isVehicleEmpty = false;
    update();
  }





}



class ScreenModel{
  Widget? screen;
  String? name;
  String? icon;
  ScreenModel(this.screen, this.name, this.icon);
}