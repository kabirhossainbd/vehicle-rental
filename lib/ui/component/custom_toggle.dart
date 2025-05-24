import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/util/styles.dart';

class CustomSwitch extends StatefulWidget {
  final String? title, subTitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, this.title, this.subTitle, required this.value, required this.onChanged});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return Row(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title ?? '',style: poppinsRegular.copyWith(color: Theme.of(context).colorScheme.textColor, fontSize: 18), ),
                SizedBox(height: 2.h),
                Text(widget.subTitle ?? '',style: poppinsRegular.copyWith(color: Theme.of(context).colorScheme.crossColor, fontSize: 12), ),
              ],
            )),

            SizedBox(width: 12.w),
            GestureDetector(
              onTap: () {
                if (_animationController!.isCompleted) {
                  _animationController!.reverse();
                } else {
                  _animationController!.forward();
                }
                widget.value == true
                    ? widget.onChanged(false)
                    : widget.onChanged(true);
              },
              child: Container(
                width: 50.0,
                height: 28.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.transparent,
                  border: Border.all(color: Theme.of(context).colorScheme.crossColor)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
                  child: Container(
                    alignment: !widget.value ? ((Directionality.of(context) == TextDirection.rtl) ? Alignment.centerRight : Alignment.centerLeft ) : ((Directionality.of(context) == TextDirection.rtl) ? Alignment.centerLeft : Alignment.centerRight),
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(shape: BoxShape.circle, color:  widget.value ?  Theme.of(context).primaryColor : Theme.of(context).colorScheme.crossColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}