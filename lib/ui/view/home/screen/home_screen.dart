import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:vehicle_rental_app/ui/component/home_shimmer.dart';
import 'package:vehicle_rental_app/ui/component/no_data_screen.dart';
import 'package:vehicle_rental_app/ui/view/home/controller/home_controller.dart';
import 'package:vehicle_rental_app/ui/view/home/screen/widget/car_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    Get.find<HomeController>().getVehicleList(true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (home) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ///for this item all activities
              if(home.isVehicleEmpty)...[
                Expanded(child: HomeShimmer(isEnabled: true))
              ]else if(home.vehicleList.isEmpty)...[
                Expanded(child: NoDataScreen())
              ]else...[
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: ()async{
                      await home.getVehicleList(true);
                    },
                    child: StaggeredGridView.countBuilder(
                        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        padding:  EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
                        itemCount: home.vehicleList.length,
                        itemBuilder: (context, idx) => CarView(vehicle: home.vehicleList[idx]),
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1)
                    ),
                  ),
                )
              ],

            ],
          ),
        )
      ),
    );
  }
}
