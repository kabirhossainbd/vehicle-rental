import 'dart:async';
import 'package:vehicle_rental_app/service/network_service.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/ui/component/custom_toast.dart';
import 'package:vehicle_rental_app/ui/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


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

    Get.find<HomeController>().initPageController(widget.pageIndex);
    _observer.checkInternetStatus().then((isInternet){
      Get.find<HomeController>().setIsNetworkConnected(isInternet, context);
    });

    _observer.connectivityStream.listen((event) {
      Get.find<HomeController>().setIsNetworkConnected(event, context);
      if(event){
        // Get.find<PostActivityController>().getAllActivities();
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
              appBar: home.pageIndex == 0 ? null : AppBar(
                elevation: 1,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
                  statusBarBrightness: Brightness.light, // For iOS (dark icons)
                ),
                title: Text(home.pageIndex == 1 ? 'All Messages': home.screen[home.pageIndex].name!.tr, style: TextStyle(color: Theme.of(context).colorScheme.textColor),),
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
