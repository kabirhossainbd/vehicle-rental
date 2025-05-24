import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_app/ui/component/custom_button.dart';
import 'package:vehicle_rental_app/ui/view/auth/controller/auth_controller.dart';
import 'package:vehicle_rental_app/ui/view/auth/view/screen/login_screen.dart';
import 'package:vehicle_rental_app/util/images.dart';
import 'package:vehicle_rental_app/util/styles.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (auth) => Scaffold(
          key: _globalKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
          ),
          body: Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            decoration:  BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AllImages.logo, height: 120, width: 120),
                SizedBox(height: 16.h),
                Text('Vehicle Rental', style: poppinsRegular.copyWith(color: Theme.of(context).primaryColor, fontSize: 48, letterSpacing: 10)),
                SizedBox(height: 100.h),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(
                    onTap: ()=> Get.to(LoginScreen()),
                    height: 52,
                      buttonText: 'Get started'),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
      ),
    );
  }
}

