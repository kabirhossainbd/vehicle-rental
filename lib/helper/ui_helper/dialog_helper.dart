import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DialogHelper {
  //show error dialog
  static void showErrorDialog({String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: poppinsSemiBold.copyWith(color: Theme.of(Get.context!).colorScheme.textColor, fontSize: 18),
              ),
              Text(
                description ?? '',
                style: poppinsRegular,
              ),

              GestureDetector(
                onTap: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                        color: Theme.of(Get.context!).primaryColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Theme.of(Get.context!).primaryColor)
                    ),
                    child: Text('Okay', style: poppinsRegular.copyWith(color: Colors.white))),
              )
            ],
          ),
        ),
      ),
    );
  }

  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 15),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }

  static void showNoInternetDialog(){
    Get.dialog( AlertDialog(
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 50, bottom: 16, left: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: (){
                    Get.back();
                  },
                  child: Text('Ok',
                    style: poppinsRegular.copyWith(
                        fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
              ),
            )
        )
      ],
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
      title: RichText(
        text:  TextSpan(text: 'Unable to log in'.tr, style: poppinsMedium.copyWith(
            fontSize: 20, color: Theme.of(Get.context!).colorScheme.textColor)),
      ),
      content: Text("Due to internet connection you can't login.Please try logging in again.".tr,  style: poppinsRegular.copyWith(color: Colors.grey, fontSize: 16),),
    ));
  }

}
