import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/util/styles.dart';
import 'package:flutter/material.dart';


class PostButton extends StatelessWidget {
  final Widget? icon;
  final String? label;
  final Color color;
  final VoidCallback? onTap;
  final bool levelColor;
  final TextStyle? textStyle;
  const PostButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.color = Colors.black,  this.levelColor = false, this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: onTap,
        child: SizedBox(
          height: 25.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon!,
              const SizedBox(width: 9,),
              Text(label ?? '', style: textStyle ?? poppinsMedium.copyWith(color: levelColor ? Theme.of(context).colorScheme.redColor : const Color(0xFF252525).withOpacity(0.8), fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}