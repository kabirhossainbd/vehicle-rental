import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/util/styles.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String? title, icon;
  final VoidCallback? onBack, onIconTap;
  final bool isBackButton;
  final List<Widget>? actions;
  const CustomAppbar({super.key, this.title, this.onBack, this.icon, this.onIconTap, this.isBackButton = true, this.actions});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 50);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      leadingWidth: 10,
      leading: const SizedBox(),
      title: Row(
        children: [
          if(widget.isBackButton)...[
            SizedBox(width: 10.w),
            InkWell(onTap: widget.onBack ?? () => Get.back(), child: Icon(Icons.arrow_back_ios, size: 24, color: Theme.of(context).primaryColor)),
            SizedBox(width: 8.w),
          ],

          Expanded(child: Text(widget.title ?? '', style: poppinsMedium.copyWith(color: Theme.of(context).colorScheme.textColor))),
        ],
      ),
      actions: widget.actions,
      centerTitle: false,
      elevation: 1,
      shadowColor: Theme.of(context).colorScheme.textColor.withOpacity(0.12),
      bottomOpacity: 0.8,
      automaticallyImplyLeading: false,
      titleSpacing: 10,
      scrolledUnderElevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}