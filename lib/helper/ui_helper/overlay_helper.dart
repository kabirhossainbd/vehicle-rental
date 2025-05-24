import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/util/styles.dart';
import 'package:flutter/material.dart';

class OverlayManager {
  static OverlayEntry? _overlayEntry;

  static void showOverlay(BuildContext context) {
    if (_overlayEntry == null) {
      OverlayState overlayState = Overlay.of(context);
      _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          bottom: 80,
          left: 20,
          right: 20,
          child: Material(
            color: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child:  Text(
                  'You’re using Offline mode',
                  style: poppinsRegular.copyWith(color: Theme.of(context).colorScheme.whiteColor, fontSize: 12)
              ),
            ),
          ),
        ),
      );
      overlayState.insert(_overlayEntry!);
    }
  }

  static void hideOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
