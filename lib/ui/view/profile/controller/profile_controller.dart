import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:objectbox/objectbox.dart';
import 'package:vehicle_rental_app/ui/view/profile/data/model/user_model.dart';
import 'package:vehicle_rental_app/ui/view/profile/data/repo/profile_repo.dart';

class ProfileController extends GetxController implements GetxService {
  final ProfileRepo profileRepo;
  late final Store store;
  late final Box<UserEntity> userBox;
  ProfileController(this.store, {required this.profileRepo}) {
    userBox = store.box<UserEntity>();
  }

  UserEntity? _userModel;
  UserEntity? get userModel => _userModel;


  Future<void> getProfile(String userId) async {
    // Check local cache first (optional, skip if always reloading)
    if (userBox.count() > 0) {
      final userEntity = userBox.getAll().first;
      _userModel = UserEntity(
        email: userEntity.email,
        password: userEntity.password,
        token: userEntity.token,
        message: userEntity.message,
        userId: userEntity.userId,
        totalTrip: userEntity.totalTrip,
      );
      update();
      return;
    }

    // API call
    Response response = await profileRepo.getProfile(userId);
    if (response.statusCode.toString().startsWith('20')) {
      final data = UserEntity.fromJson(response.body);
      _userModel = data;

      // Cache in ObjectBox
      userBox.removeAll();
      userBox.put(UserEntity.fromJson(response.body));
    } else {
      debugPrint(response.body.toString());
    }

    update();
  }


  void clearProfileCache() {
    userBox.removeAll();
  }

}
