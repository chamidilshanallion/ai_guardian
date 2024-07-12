import 'package:ai_guaridan_app/constants/constants.dart';
import 'package:ai_guaridan_app/presentation/camera_screen/new_camera_screen.dart';
import 'package:ai_guaridan_app/widgets/live_camera_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  void _showAddCameraBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddCameraBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child:
          //       TextButton.icon(
          //           onPressed: () {
          //             _showAddCameraBottomSheet(context);
          //           },
          //           icon: Icon(
          //               Icons.add,
          //               color: Color(0xFF9EABB8)
          //           ),
          //           label: Text(
          //               'Add A New Camera',
          //             style: TextStyle(
          //               color: Color(0xFF9EABB8)
          //             ),
          //           )
          //       ),
          // ),
          SizedBox(
            height: 10.h,
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 1.0,
            padding: const EdgeInsets.all(16.0),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: <String>[
              'assets/images/door.png',
              'assets/images/room.png',
              'assets/images/door.png',
              'assets/images/room.png',
            ].map((String url) {
              return LiveCameraContainer(imageUrl: url);
            }).toList(),
          )
        ],
      ),
    );
  }
}
