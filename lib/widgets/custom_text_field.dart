import 'package:ai_guaridan_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  const CustomTextField({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: ColorConstants.whiteColor,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: ColorConstants.hintColor
          ),
          border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
          enabledBorder:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
          focusedBorder:
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  // color: theme.colorScheme.secondaryContainer.withOpacity(0.5),
                  width: 1,
                ),
              ),
        ),
      ),
    );
  }
}
