import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiExtension {
  alertErrorFunc(String statusError, String descriptionError) {
    return Get.snackbar(
      "$statusError",
      "$descriptionError",
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color(0xffd9534f),
      colorText: Colors.white,
      margin: EdgeInsets.all(20.0),
    );
  }
}
