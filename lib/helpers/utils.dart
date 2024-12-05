import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sih_internship_app/helpers/cofig.dart';

class Utils {
  static showtoast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primary,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
