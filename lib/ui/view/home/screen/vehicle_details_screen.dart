import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_app/core/data/entity/vehicle_entity.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/ui/component/custom_image.dart';
import 'package:vehicle_rental_app/ui/component/custom_toast.dart';
import 'package:vehicle_rental_app/ui/view/home/screen/widget/location_helper.dart';
import 'package:vehicle_rental_app/util/styles.dart';

class DetailsPage extends StatefulWidget {
  final VehicleEntity vehicleModel;
  final bool isRotated;
  const DetailsPage({super.key, required this.vehicleModel, this.isRotated = false});



  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor: const Color(0xfff8f8f8), //appbar bg color

          leading: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.05,
            ),
            child: SizedBox(
              height: size.width * 0.1,
              width: size.width * 0.1,
              child: InkWell(
                onTap: () {
                  Get.back(); //go back to home page
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, //icon bg color
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColor,
                    size: size.height * 0.025,
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: size.width * 0.15,
          centerTitle: true,
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: const Color(0xfff8f8f8), //background color
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              child: Stack(
                children: [
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      if (widget.isRotated) Hero(
                        tag: widget.vehicleModel.hashCode,
                        child: CustomImage(
                          imageUrl: widget.vehicleModel.image ?? '',
                          height: size.width * 0.5,
                          width: size.width * 0.8,
                          fit: BoxFit.contain,
                        ),
                      ) else Hero(
                        tag: widget.vehicleModel.hashCode,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(pi),
                          child: CustomImage(
                            imageUrl: widget.vehicleModel.image ?? '',
                            height: size.width * 0.5,
                            width: size.width * 0.8,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.vehicleModel.name,
                              textAlign: TextAlign.left,
                              style: poppinsRegular.copyWith(
                                color: const Color(0xff3b22a1),
                                fontSize: size.width * 0.05,
                              ),
                            ),
                          ),
                         const SizedBox(width: 20),

                          const SizedBox(height: 5),
                          Text(
                            '${widget.vehicleModel.costPerMinute}\$',
                            style: poppinsRegular.copyWith(
                              color:  const Color(0xff3b22a1),
                              fontSize: size.width * 0.04,
                            ),
                          ),
                          Text(
                            '/per day',
                            style: poppinsRegular.copyWith(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: size.width * 0.025,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.02,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildStat(
                              Icons.battery_charging_full,
                              '${widget.vehicleModel.battery} KM',
                              'Battery',
                              size,
                              Colors.orangeAccent,
                            ),
                            buildStat(
                              Icons.update,
                              '${GetUtils.capitalizeFirst(widget.vehicleModel.status ?? '')}',
                              'Status',
                              size,
                              _getStatusColor(widget.vehicleModel.status),
                            ),
                            buildStat(
                              Icons.type_specimen,
                              '${widget.vehicleModel.type}',
                              'Type',
                              size,
                                Theme.of(context).primaryColor
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.03,
                        ),
                        child: Text(
                          'Vehicle Location',
                          style: poppinsSemiBold.copyWith(
                            color: const Color(0xff3b22a1),
                            fontSize: size.width * 0.055,
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                            vertical: size.height * 0.015,
                          ),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.map,
                                color: const Color(0xff3b22a1),
                                size: size.height * 0.05,
                              ),
                              LocationName(vehicleModel: widget.vehicleModel, isShort: false,textStyle: poppinsRegular.copyWith(color: Theme.of(context).primaryColor, fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  buildSelectButton(size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStat(IconData icon, String title, String desc, Size size, Color color) {
    return Expanded(
      child: Container(
        height: 120,
        width: 200,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: size.width * 0.08,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.width * 0.02,
              ),
              child: Text(
                title,
                style: poppinsRegular.copyWith(
                  color:  Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Text(
              desc,
              style: poppinsRegular.copyWith(
                color: Theme.of(context).colorScheme.crossColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'available':
        return Colors.green;
      case 'unavailable':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

Align buildSelectButton(Size size) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: EdgeInsets.only(
        bottom: size.height * 0.01,
      ),
      child: SizedBox(
        height: size.height * 0.07,
        width: size.width,
        child: InkWell(
          onTap: () {
            showCustomToast('Rental started successfully');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff3b22a1),
            ),
            child: Align(
              child: Text(
                'Rental',
                textAlign: TextAlign.center,
                style: poppinsRegular.copyWith(
                  fontSize: size.height * 0.025,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}