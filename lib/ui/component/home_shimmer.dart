import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:vehicle_rental_app/util/dimensions.dart';
class HomeShimmer extends StatelessWidget {
  final bool isEnabled;
  const HomeShimmer({super.key, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding:  EdgeInsets.fromLTRB(16.w,5.h, 16.w, 24.h),
          itemCount: 10,
          itemBuilder: (context, idx) =>  Container(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall, horizontal: Dimensions.paddingSizeSmall),
            // margin: const EdgeInsets.only(bottom: AppDimensions.paddingSizeDefault),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [BoxShadow(color: Colors.grey[200]!, blurRadius: 10, spreadRadius: 1)],
            ),
            child: Shimmer(
              duration: const Duration(seconds: 2),
              enabled: isEnabled,
              child: Column(children: [
                const SizedBox(height: 4),
                Container(
                  height: 110, width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                Container(height: 15, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),),
                const SizedBox(height: 4),
                Container(height: 15, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),),
                const SizedBox(height: 10),
              ]),
            ),
          ),
          staggeredTileBuilder: (index) => StaggeredTile.fit(1)

      );
  }
}



class DetailsShimmer extends StatelessWidget {
  final bool isEnabled;
  const DetailsShimmer({super.key, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
         // color: Theme.of(context).primaryColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Shimmer(
          duration: const Duration(seconds: 2),
          enabled: isEnabled,
          child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Container(
                  height: 240, width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12)
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                Container(height: 20, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: Container(height: 15, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),)),
                    const SizedBox(width: 16),
                    Expanded(child: Container(height: 15, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),)),
                  ],
                ),
                const SizedBox(height: 10),
                Container(height: 20, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: Container(height: 15, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),)),
                    const SizedBox(width: 16),
                    Expanded(child: Container(height: 15, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),)),
                    const SizedBox(width: 16),
                    Expanded(child: Container(height: 15, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),)),
                  ],
                ),
                const SizedBox(height: 10),
                Container(height: 14, width: 150, decoration: BoxDecoration(color: Colors.grey[300]),),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height: 20, width: 120, decoration: BoxDecoration(color: Colors.grey[300]),),
                    const SizedBox(width: 16),
                    Container(height: 15, width: 50, decoration: BoxDecoration(color: Colors.grey[300]),),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height: 70, width: 70, decoration: BoxDecoration(color: Colors.grey[300]),),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 15, width: 250, decoration: BoxDecoration(color: Colors.grey[300]),),
                          const SizedBox(height: 5),
                          Container(height: 15, width: 200, decoration: BoxDecoration(color: Colors.grey[300]),),
                          const SizedBox(height: 5),
                          Container(height: 15, width: 150, decoration: BoxDecoration(color: Colors.grey[300]),),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: Container(height: 160, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),)),
                    const SizedBox(width: 16),
                    Expanded(child: Container(height: 160, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: Container(height: 160, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),)),
                    const SizedBox(width: 16),
                    Expanded(child: Container(height: 160, width: double.infinity, decoration: BoxDecoration(color: Colors.grey[300]),)),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}