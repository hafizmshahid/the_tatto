import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_tatto/utils/app_sizes.dart';

  void showProcessBar(BuildContext context) {
  AlertDialog alert = AlertDialog(
      backgroundColor: Color(0x01000000),
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      content: Container(
        height: 50,
        child: SpinKitWave(
          color: Colors.white,
          size: AppSizes.appVerticalLg * 0.55,
        ),
      ));
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}