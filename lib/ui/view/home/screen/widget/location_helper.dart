import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_app/core/data/entity/vehicle_entity.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/ui/view/home/controller/home_controller.dart';
import 'package:vehicle_rental_app/util/styles.dart';

class LocationName extends StatelessWidget {
  final VehicleEntity vehicleModel;
  final bool isScrolling, isShort;
  final TextStyle? textStyle;
  const LocationName({super.key, required this.vehicleModel, this.isScrolling = false, this.textStyle, this.isShort = true});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (vehicleCon) => FutureBuilder<String>(
        future: vehicleCon.getAddressFromLatLng(vehicleModel.location.target?.lat ?? 0,  vehicleModel.location.target?.lng ?? 0, isShort),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting && isScrolling == false) {
            return const SizedBox();
          }
          if (snapshot.hasError) {
            return const Center(child: Text(""));
          }
          if (!snapshot.hasData) {
            return const Center(child: SizedBox());
          }

          String total = snapshot.data!;

          return Text(total, style: textStyle ?? poppinsRegular.copyWith(color: Theme.of(context).colorScheme.textColor, fontSize: 16), overflow: TextOverflow.ellipsis, maxLines: 2);
        },
      ),
    );
  }
}