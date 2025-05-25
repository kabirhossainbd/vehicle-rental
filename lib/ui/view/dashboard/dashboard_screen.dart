import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_rental_app/routes.dart';
import 'package:vehicle_rental_app/service/network_service.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/ui/component/custom_toast.dart';
import 'package:vehicle_rental_app/ui/view/auth/controller/auth_controller.dart';
import 'package:vehicle_rental_app/ui/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_app/ui/view/profile/controller/profile_controller.dart';
import 'package:vehicle_rental_app/util/dimensions.dart';
import 'package:vehicle_rental_app/util/images.dart';
import 'package:vehicle_rental_app/util/styles.dart';


class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  const DashboardScreen({super.key, this.pageIndex = 0});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool _canExit = false;

  final NetworkConnectivityObserver _observer = NetworkConnectivityObserver();

  @override
  void initState() {
    Get.find<ProfileController>().getProfile(Get.find<AuthController>().getUserId());
    Get.find<HomeController>().initPageController(widget.pageIndex);
    _observer.checkInternetStatus().then((isInternet){
      Get.find<HomeController>().setIsNetworkConnected(isInternet, context);
    });

    _observer.connectivityStream.listen((event) {
      if(!mounted) return;
      Get.find<HomeController>().setIsNetworkConnected(event, context);
      if(event){
        Get.find<HomeController>().getVehicleList(true);
        Get.find<ProfileController>().getProfile(Get.find<AuthController>().getUserId());
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (home) => WillPopScope(
        onWillPop: () async {
          if(_scaffoldKey.currentState!.isEndDrawerOpen){
            _scaffoldKey.currentState?.closeEndDrawer();
            return false;
          }else{
            if (home.pageIndex != 0) {
              home.setPage(0);
              return false;
            } else {
              if (_canExit) {
                return true;
              } else {
                showCustomToast('Please again to exit app');
                _canExit = true;
                Timer(const Duration(seconds: 2), () {
                  _canExit = false;
                });
                return false;
              }
            }
          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppBar(
                elevation: 1,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
                  statusBarBrightness: Brightness.light, // For iOS (dark icons)
                ),
                title: Image.asset(AllImages.rentalLogo, height: 200, width: 160),
                actions: [
                  if(home.pageIndex == 1)...[
                    IconButton(onPressed: (){
                      _customLogout(context);
                    }, icon: Icon(Icons.logout, color: Theme.of(context).primaryColor, size: 24,)),
                    SizedBox(width: 12.w)
                  ]
                ],
              ),
              body: PageView.builder(
                controller: home.pageController,
                itemCount: home.screen.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return home.screen[index].screen;
                },
              ),
              extendBodyBehindAppBar: true,
              extendBody: true,
              bottomNavigationBar: Container(
                  decoration:  BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: const Border(
                      top: BorderSide(width: 0.09,
                          style: BorderStyle.solid,
                          color: Colors.black
                      ),
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0,12,5,12),
                      child: Row( crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: home.screen.map((item){
                          int index = home.screen.indexOf(item);
                          return BottomNavItem(image:  item.icon, title: item.name?.tr, isSelected: home.pageIndex == index, onTap: () async{
                            home.setPage(index);
                          });
                        }).toList()
                      ),
                    ),
                  )
              ),

            )
        ),
      ),
    );
  }

  _customLogout(BuildContext context) {
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
                                        fontSize: Dimensions.fontSizeDefault),
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
                                onTap: (){
                                  Get.find<AuthController>().clearSharedData().then((value){
                                    Get.offAllNamed(RouterHelper.loginScreen);
                                  });
                                },
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



class BottomNavItem extends StatelessWidget {
  final String? image;
  final String? title;
  final VoidCallback? onTap;
  final bool isSelected;
  const BottomNavItem({super.key,  this.image, this.title, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        child: Column( mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(image!, height: 24, width: 24, color: isSelected ? Theme.of(context).primaryColor : const Color(0xFF5B5B5B)),
            const SizedBox(height: 4,),
            Text(title!, style: TextStyle(fontSize: 9, fontStyle: FontStyle.normal, fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400, color:  isSelected ? Theme.of(context).primaryColor : const Color(0xFF5B5B5B), overflow: TextOverflow.ellipsis),textAlign: TextAlign.center, maxLines: 1,),
          ],
        ),
      ),
    );
  }
}
