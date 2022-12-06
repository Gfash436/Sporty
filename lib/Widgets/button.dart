import 'package:flutter/material.dart';
import 'package:sporty/Utilities/colors.dart';

Widget customButton(
    {VoidCallback? tap,
    bool? status = false,
    String? text = 'Sign Up',
    bool? isValid = false,
    BuildContext? context}) {
  return GestureDetector(
      onTap: status == true ? null : tap,
      child: Container(
          height: 54,
          margin: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: status == false ? blue : lightGrey,
              borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          child: Text(
            status == false ? text! : 'Please wait...',
            style: TextStyle(
                color: white, fontSize: 24, fontWeight: FontWeight.w600),
          )));
}

Widget customButton2(
    {VoidCallback? tap,
    bool? status = false,
    String? text = 'Sign In',
    bool? isValid = false,
    BuildContext? context}) {
  return GestureDetector(
      onTap: status == true ? null : tap,
      child: Container(
          height: 49,
          margin: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: status == false ? white : green,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: green)),
          width: MediaQuery.of(context!).size.width,
          child: Text(
            status == false ? text! : 'Please wait...',
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w700),
          )));
}
