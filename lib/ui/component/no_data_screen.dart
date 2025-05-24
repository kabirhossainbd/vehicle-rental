import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/util/dimensions.dart';
import 'package:vehicle_rental_app/util/images.dart';
import 'package:vehicle_rental_app/util/styles.dart';

class NoDataScreen extends StatelessWidget {
  final String? title, description;
  final bool showIcon;
  const NoDataScreen({super.key, this.title, this.description, this.showIcon = true});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(Dimensions.paddingSizeLarge),
      child: Align(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.min, children: [

          if(showIcon)...[
            Image.asset(
              AllImages.noData,
              width: MediaQuery.of(context).size.height*0.6, height: MediaQuery.of(context).size.height*.3,
            ),
          ],


          Text(
            title ?? 'Nothing Found',
            style: poppinsMedium.copyWith(color: Theme.of(context).colorScheme.crossColor, fontSize: MediaQuery.of(context).size.height*0.02),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            description ?? '',
            style: poppinsRegular.copyWith(color: Theme.of(context).colorScheme.crossColor, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
