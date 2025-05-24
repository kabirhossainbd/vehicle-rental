import 'package:get/get.dart';
import 'package:flutter/material.dart';

void showCustomToast(String message){
  Get.showSnackbar(GetSnackBar(
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.black.withOpacity(0.8),  message: message,
    maxWidth: 1170,  duration: const Duration(seconds: 1),
    snackStyle: SnackStyle.FLOATING,  margin: const EdgeInsets.fromLTRB(5, 50,5,10),
    borderRadius: 6, isDismissible: true,
    dismissDirection: DismissDirection.horizontal,));
}