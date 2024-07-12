import 'package:ai_guaridan_app/presentation/homepage/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstants.themeColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 24.r
            ),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SIGN UP',
                  style: TextStyle(
                      color: ColorConstants.guardianColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Looks like you don’t have an account. Let’s create a new account for you.',
                  style: TextStyle(
                      color: ColorConstants.whiteColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  hintText: 'First Name',
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  hintText: 'Last Name',
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  hintText: 'Password',
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomElevatedButton(
                  buttonTitle: 'CREATE ACCOUNT',
                  bgColor:  ColorConstants.logoColor,
                  isAuthButton: true, onPressed: () {
                    Get.to(()=> HomePageScreen());
                },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: ColorConstants.whiteColor,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.whiteColor
                      ),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Expanded(
                      child: Divider(
                        color: ColorConstants.whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22.h,
                ),
                Container(
                  child: Column(
                    children: [
                      CustomElevatedButton(
                        buttonTitle: 'Sign Up with Google',
                        bgColor:  ColorConstants.whiteColor, onPressed: () {  },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomElevatedButton(
                        buttonTitle: 'Sign Up with Facebook',
                        bgColor:  ColorConstants.whiteColor, onPressed: () {  },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
