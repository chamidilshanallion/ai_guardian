import 'package:ai_guaridan_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class AddCameraBottomSheet extends StatefulWidget {
  @override
  _AddCameraBottomSheetState createState() => _AddCameraBottomSheetState();
}

class _AddCameraBottomSheetState extends State<AddCameraBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _cameraNameController = TextEditingController();
  final _ipAddressController = TextEditingController();

  int _currentStep = 0;

  @override
  void dispose() {
    _cameraNameController.dispose();
    _ipAddressController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  void _finish() {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Camera added successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.40,
        decoration: new BoxDecoration(
          color: ColorConstants.themeColor,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (_currentStep == 0) ...[
               Container(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       'Room Camera Name',
                       style: TextStyle(
                           fontSize: 16.0,
                           color: ColorConstants.whiteColor
                       ),
                     ),
                     SizedBox(
                       height: 10.h,
                     ),
                     CustomTextField(
                       hintText: '',
                     ),
                   ],
                 ),
               ),
                Container(
                  child: Column(
                    children: [
                      CustomElevatedButton(
                          buttonTitle: 'Continue',
                          bgColor:  ColorConstants.logoColor,
                          isAuthButton: true,
                          onPressed: _nextStep
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Text(
                          'Back',
                          style: TextStyle(
                              color: ColorConstants.logoColor
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
              if (_currentStep == 1) ...[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'IP Address',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: ColorConstants.whiteColor
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        hintText: '',
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  color: ColorConstants.whiteColor,
                  child: Center(
                    child: Text('Live Camera Preview'),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      CustomElevatedButton(
                          buttonTitle: 'Continue',
                          bgColor:  ColorConstants.logoColor,
                          isAuthButton: true,
                          onPressed: _nextStep
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: _previousStep,
                          child: Text(
                            'Back',
                            style: TextStyle(
                                color: ColorConstants.logoColor
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
              if (_currentStep == 2) ...[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/success.png',
                    width: 80.0,
                    height: 80.0,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Success! Camera has been added.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorConstants.whiteColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
                CustomElevatedButton(
                    buttonTitle: 'Done',
                    bgColor:  ColorConstants.logoColor,
                    isAuthButton: true,
                    onPressed: _finish
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
