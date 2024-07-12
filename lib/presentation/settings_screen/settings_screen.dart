import 'package:ai_guaridan_app/constants/constants.dart';
import 'package:ai_guaridan_app/presentation/camera_screen/camera_list_screen.dart';
import 'package:ai_guaridan_app/presentation/guardian_screen/guardian_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/setting_menu_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            SettingMenuWidget(
              title: 'Guardians',
              icon: Icons.security_outlined,
              onPress: () {
                Get.to(()=> GuardianListScreen());
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            SettingMenuWidget(
              title: 'Cameras',
              icon: Icons.camera_enhance_outlined,
              onPress: () {
                Get.to(()=> CameraListScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
