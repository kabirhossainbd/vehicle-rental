import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/util/dimensions.dart';
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
                style: Get.textTheme.bodyLarge,
              ),
              Text(
                description ?? '',
                style: Get.textTheme.displayMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show toast
  //show snack bar
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
            fontSize: 20)),
      ),
      content: Text('An unexpected error occurred.Please try logging in again.'.tr,  style: poppinsRegular.copyWith(color: Colors.grey, fontSize: 16),),
    ));
  }

  static void showDeleteDialog(String? title, String? subTitle, String? confirmBtn, BuildContext context, {VoidCallback? onTap}){
    Get.dialog( AlertDialog(
        alignment: Alignment.center,
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      onTap: () => Get.back(),
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all( color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text('Cancel'.tr,
                          style: poppinsRegular.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: Dimensions.fontSizeDefault),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )),
                  const SizedBox(width: 20,),
                  InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      onTap: onTap,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          confirmBtn ?? "Log Out".tr,
                          style: poppinsRegular.copyWith(
                              color: Theme.of(context).colorScheme.whiteColor,
                              fontSize:
                              Dimensions.fontSizeDefault),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                  )
                ]),
          )
        ],
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        title: Text( title ?? 'Log Out'.tr, style: poppinsRegular.copyWith(
            color: Theme.of(context).colorScheme.textColor,
            fontSize: 28),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,),
        content:  Text( subTitle ?? 'Are you sure you want to logout?'.tr,
          style: poppinsRegular.copyWith(
              color: Theme.of(context).colorScheme.textColor,
              fontSize:
              Dimensions.fontSizeLarge),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        )
    ));
  }
}
