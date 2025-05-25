import 'package:geocoding/geocoding.dart';
import 'package:objectbox/objectbox.dart';
import 'package:vehicle_rental_app/core/data/entity/vehicle_entity.dart';
import 'package:vehicle_rental_app/helper/ui_helper/overlay_helper.dart';
import 'package:vehicle_rental_app/ui/view/home/data/repo/home_repo.dart';
import 'package:vehicle_rental_app/ui/view/home/screen/home_screen.dart';
import 'package:vehicle_rental_app/ui/view/profile/screen/profile_screen.dart';
import 'package:vehicle_rental_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController  implements GetxService {
  final HomeRepo homeRepo;
  late final Store store;
  late final Box<VehicleEntity> vehicleBox;
  HomeController(this.store, {required this.homeRepo}) {
    vehicleBox = store.box<VehicleEntity>();
  }


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
  List<VehicleEntity> _vehicleList = [];
  List<VehicleEntity> get vehicleList => _vehicleList;

  bool _isVehicleEmpty = true;
  bool get isVehicleEmpty => _isVehicleEmpty;

  Future<void> getVehicleList(bool reload) async {
    if (vehicleBox.count() > 0) {
      _vehicleList = vehicleBox.getAll();
      _isVehicleEmpty = false;
      update();
      return;
    }

    Response response = await homeRepo.getVehicleList();

    if (response.statusCode == 200) {
      _vehicleList = (response.body as List).map((item) => VehicleEntity.fromJson(item)).toList();

      // Cache in ObjectBox
      vehicleBox.removeAll();
      vehicleBox.putMany(_vehicleList);

    } else {
      debugPrint('API error');
    }

    _isVehicleEmpty = false;
    update();
  }


  void clearVehicleCache() {
    vehicleBox.removeAll();
  }


  /// vehicle api call
  VehicleEntity? _vehicleDetails;
  VehicleEntity? get vehicleDetails => _vehicleDetails;

  Future<void> getVehicleDetails(String carId) async {
    _vehicleDetails = null;
    Response response = await homeRepo.getVehicleDetails(carId);
    if (response.statusCode == 200) {
      _vehicleDetails = VehicleEntity.fromJson(response.body);
    } else {
      debugPrint('API error');
    }
    _isVehicleEmpty = false;
    update();
  }




  Future<String> getAddressFromLatLng(double lat, double lng, bool isShort) async {
    String address = '';
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        if(isShort){
          address = '${place.administrativeArea}';
        }else{
          address = '${place.street}, ${place.locality}, ${place.postalCode}, ${place.administrativeArea}, ${place.country}';
        }
       // address = '${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}';
       // print('location:: ${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}');
        return address;
      }else{
        return address;
      }
    } catch (e) {
      print('Error: $e');
    }
    return address;
  }



}



class ScreenModel{
  Widget? screen;
  String? name;
  String? icon;
  ScreenModel(this.screen, this.name, this.icon);
}