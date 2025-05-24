
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/ui/component/custom_appbar.dart';
import 'package:vehicle_rental_app/ui/component/custom_image.dart';
import 'package:vehicle_rental_app/ui/view/home/data/response/vehicle_model.dart';
import 'package:vehicle_rental_app/util/date_converter.dart';
import 'package:vehicle_rental_app/util/styles.dart';

class CarDetailsScreen extends StatefulWidget {
  final VehicleModel vehicleModel;
  const CarDetailsScreen({super.key, required this.vehicleModel});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {

  VehicleModel? vehicle;

  @override
  void initState() {
    vehicle = widget.vehicleModel;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppbar(title: 'Vehicle Details',),
      body: SafeArea(child: vehicle == null ? Center(child: CircularProgressIndicator()): ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        children: [

          Hero(
            tag: vehicle?.hashCode ?? '0',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomImage(
                imageUrl: vehicle?.image ?? '',
                height: 200,
                width: double.infinity,
              ),
            ),
          ),

          SizedBox(height: 16.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(vehicle?.name ?? '', style: poppinsSemiBold.copyWith(color: Theme.of(context).colorScheme.textColor, fontSize: 24, height: 1.2), maxLines: 2, overflow: TextOverflow.ellipsis)),
            ],
          ),
          SizedBox(height: 8.h,),
          Text(vehicle?.type ?? '', style: poppinsRegular.copyWith(color: Theme.of(context).colorScheme.crossColor, fontSize: 12)),



          SizedBox(height: 8.h,),
          Text("Date & Time:", style: poppinsMedium.copyWith(color: Theme.of(context).colorScheme.textColor, fontSize: 14)),
          Row(
            children: [
             // Text(DateConverter.convertActivityDateTime(vehicle?.createAt), style: poppinsMedium.copyWith(color: Theme.of(context).primaryColor, fontSize: 12)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: CircleAvatar(radius: 2, backgroundColor: Theme.of(context).primaryColor,),
              ),
            ],
          ),
          SizedBox(height: 8.h,),
          Text("Location:", style: poppinsMedium.copyWith(color: Theme.of(context).colorScheme.textColor, fontSize: 14)),
          Text( '${vehicle?.location?.lat ?? 0}-${vehicle?.location?.lng ?? 0}', style: poppinsMedium.copyWith(color: Theme.of(context).primaryColor, fontSize: 12)),


        ],
      )),
    );
  }
}
