import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/util/styles.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonText;
  final bool isColor, isOutline;
  final double height;
  const CustomButton({ super.key , this.onTap, required this.buttonText, this.isColor = true, this.isOutline = false, this.height = 48});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: (isOutline) ? null : isColor ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.crossColor.withOpacity(0.3),
            border: Border.all(color: isOutline ? Theme.of(context).primaryColor : Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(buttonText,
            style: poppinsMedium.copyWith(
                fontSize: 16,
                color: isOutline ? Theme.of(context).primaryColor : isColor ? Theme.of(context).colorScheme.whiteColor : Theme.of(context).colorScheme.gray_20
            ), textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}


class Bouncing extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onPress;
  const Bouncing({required this.child, super.key, this.onPress}): assert(child != null);

  @override
  State<Bouncing> createState() => _BouncingState();
}

class _BouncingState extends State<Bouncing> with SingleTickerProviderStateMixin {
  double _scale = 0.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        if (widget.onPress != null) {
          _controller.forward();
        }
      },
      onPointerUp: (PointerUpEvent event) {
        if (widget.onPress != null) {
          _controller.reverse();
          widget.onPress!();
        }
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}