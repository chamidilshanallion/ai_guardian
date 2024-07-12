import 'package:ai_guaridan_app/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_elevated_button.dart';
import '../homepage/home_page_screen.dart';

class GuardianScreen extends StatefulWidget {
   GuardianScreen({super.key});

  @override
  State<GuardianScreen> createState() => _GuardianScreenState();
}

class _GuardianScreenState extends State<GuardianScreen> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  @override
  void dispose() {
    _startDateController.dispose();
    _startTimeController.dispose();
    _endDateController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.format(context);
      });
    }
  }

  Color _statusColor = Colors.green;
  bool _isActivated = false;

  void _toggleStatus(bool value) {
    setState(() {
      _isActivated = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(
        // title: const Text('DateTime Picker'),
        backgroundColor: ColorConstants.themeColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Start Date',
                      style: TextStyle(
                          color: ColorConstants.whiteColor,
                        fontSize: 16.0
                      ),
                    ),
                    SizedBox(
                      width: 100.0,
                      child: TextField(
                        controller: _startDateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                        style: TextStyle(
                          color: Color(0xFF9EABB8),
                          fontSize: 14.0,
                        ),
                        onTap: () => _selectDate(context, _startDateController),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Start Time',
                      style: TextStyle(
                          color: ColorConstants.whiteColor,
                        fontSize: 16.0
                      ),
                    ),
                    SizedBox(
                      width: 100.0,
                      child: TextField(
                        controller: _startTimeController,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color(0xFF9EABB8),
                          fontSize: 14.0,
                        ),
                        onTap: () => _selectTime(context, _startTimeController),
                      ),
                    ),
                  ],
                ),

              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'End Date',
                      style: TextStyle(
                          color: ColorConstants.whiteColor,
                        fontSize: 16.0
                      ),
                    ),
                    SizedBox(
                      width: 100.0,
                      child: TextField(
                        controller: _startDateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                        style: TextStyle(
                          color: Color(0xFF9EABB8),
                          fontSize: 14.0,
                        ),
                        onTap: () => _selectDate(context, _startDateController),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'End Time',
                      style: TextStyle(
                          color: ColorConstants.whiteColor,
                        fontSize: 16.0
                      ),
                    ),
                    SizedBox(
                      width: 100.0,
                      child: TextField(
                        controller: _startTimeController,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color(0xFF9EABB8),
                          fontSize: 14.0,
                        ),
                        onTap: () => _selectTime(context, _startTimeController),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Activation Status: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  _isActivated
                      ? "You're being monitored right now."
                      : "You're not being monitored right now.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9EABB8),
                  ),
                ),
              ],
            ),
            Switch(
              value: _isActivated,
              onChanged: _toggleStatus,
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.red.withOpacity(0.2),
            ),
          ],
        ),
          SizedBox(
            height: 40.h,
          ),
        CustomElevatedButton(
              buttonTitle: 'Pay \$14.40',
              bgColor:  ColorConstants.logoColor,
              isAuthButton: true,
              onPressed: () {
                Get.to(HomePageScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
