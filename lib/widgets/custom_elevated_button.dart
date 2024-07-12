import 'dart:ui';

import 'package:ai_guaridan_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonTitle;
  final Color bgColor;
  final bool isAuthButton;
  final VoidCallback onPressed;
   CustomElevatedButton(
      {super.key,
      required this.buttonTitle,
      required this.bgColor,
      required this.onPressed,
      this.isAuthButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0))),
        child: Text(
          buttonTitle,
          style: TextStyle(
              color: ColorConstants.blackColor,
              fontSize: 16.0,
              fontWeight: isAuthButton ? FontWeight.w600 : FontWeight.w400),
        ),
      ),
    );
  }
}
