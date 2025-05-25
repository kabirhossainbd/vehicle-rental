import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/ui/component/profile_avatar.dart';
import 'package:vehicle_rental_app/ui/view/auth/controller/auth_controller.dart';
import 'package:vehicle_rental_app/ui/view/profile/controller/profile_controller.dart';
import 'package:vehicle_rental_app/util/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (auth) => Scaffold(
        body: SafeArea(child: GetBuilder<ProfileController>(
          builder: (profile) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                ProfileAvatar(imageUrl: '', height: 80, width: 80),
                SizedBox(height: 6),
                _listItem('ID:', profile.userModel?.userId ?? '', context),
                _listItem('Email:', profile.userModel?.email ?? '', context),
                _listItem('Total Trips:', profile.userModel?.totalTrip ?? '0', context),
              ],
            ),
          ),
        )),
      ),
    );
  }

  _listItem(String title, String subTitle,BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        border: Border(
            bottom: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                width: 2
            )
        ),
      ),
      child: Row(
        children: [
          Text(title, style: poppinsRegular.copyWith(color: Theme.of(context).colorScheme.blackColor, fontSize: 14)),
          SizedBox(width: 8.w),
          Text(subTitle, style: poppinsMedium.copyWith(color: Theme.of(context).colorScheme.blackColor, fontSize: 16)),
        ],
      ),
    );
  }


}
