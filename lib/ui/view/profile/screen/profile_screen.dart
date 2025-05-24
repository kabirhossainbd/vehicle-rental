import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/ui/component/profile_avatar.dart';
import 'package:vehicle_rental_app/ui/view/auth/controller/auth_controller.dart';
import 'package:vehicle_rental_app/ui/view/home/controller/home_controller.dart';
import 'package:vehicle_rental_app/util/dimensions.dart';
import 'package:vehicle_rental_app/util/images.dart';
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
        body: SafeArea(child: ListView(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Row(
                children: [
                  ProfileAvatar(
                    imageUrl: '',
                    height: 80,
                    width: 80,
                    isColor: true,
                  ),
                  SizedBox(width: 8.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name', style: poppinsSemiBold.copyWith(color: Theme.of(context).primaryColor, fontSize: 20)),
                        SizedBox(height: 2.h),
                        Text('Description', style: poppinsRegular.copyWith(color: Theme.of(context).colorScheme.textColor, fontSize: 10), maxLines: 2,),
                      ],
                    ),
                  ),

                  SizedBox(width: 8.w),
                  SvgPicture.asset(AllImages.leftArrow),
                ],
              ),
            ),

            _listItem('Notification', context, onTap: (){}),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Text('Organizer', style: poppinsSemiBold.copyWith(color: Theme.of(context).colorScheme.textColor, fontSize: 20)),
            ),

            GestureDetector(
              onTap: (){
                Get.find<HomeController>().setPage(2);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.h),
                padding: EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.gray_20,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: SvgPicture.asset(AllImages.plus, width: 24, height: 24),
                    ),

                    SizedBox(width: 8.w),

                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Start a new event', style: poppinsRegular.copyWith(color: Theme.of(context).colorScheme.textColor, fontSize: 14)),
                        Text('Organize your own events', style: poppinsRegular.copyWith(color: Theme.of(context).colorScheme.crossColor, fontSize: 10)),
                      ],
                    )),
                    SvgPicture.asset(AllImages.leftArrow),

                  ],
                ),
              ),
            ),


            _listItem('Log Out', context,  isLogout: true, onTap: (){
              _customLogout(auth, context);
            }, ),
          ],
        )),
      ),
    );
  }

  _listItem(String title,BuildContext context, {VoidCallback? onTap, bool? isLogout}){
    return InkWell(
      onTap: onTap,
      child: Container(
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
            Expanded(child: Text(title, style: poppinsRegular.copyWith(color: isLogout == true ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.blackColor, fontSize: 16))),
            SvgPicture.asset(isLogout == true ? AllImages.logout : AllImages.leftArrow),
          ],
        ),
      ),
    );
  }

  _customLogout(AuthController auth, BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                  alignment: Alignment.center,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  actionsAlignment: MainAxisAlignment.spaceBetween,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                onTap: () => Get.back(),
                                child: Container(
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                     border: Border.all( color: Theme.of(context).primaryColor),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text('Cancel'.tr,
                                    style: poppinsRegular.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontSize:
                                        Dimensions.fontSizeDefault),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )),
                            const SizedBox(width: 20,),
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                //onTap: ()=> auth.logOut(),
                                child: Container(
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    "Log Out".tr,
                                    style: poppinsRegular.copyWith(
                                        color: Theme.of(context).colorScheme.whiteColor,
                                        fontSize:
                                        Dimensions.fontSizeDefault),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )
                            )
                          ]),
                    )
                  ],
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  title: Text('Log Out'.tr, style: poppinsRegular.copyWith(
                      color: Theme.of(context).colorScheme.textColor,
                      fontSize: 28),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,),
                  content:  Text( 'Are you sure you want to logout?'.tr,
                    style: poppinsRegular.copyWith(
                        color: Theme.of(context).colorScheme.textColor,
                        fontSize:
                        Dimensions.fontSizeLarge),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: false,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }
}
