import 'package:ai_guaridan_app/constants/constants.dart';
import 'package:ai_guaridan_app/presentation/camera_screen/camera_screen.dart';
import 'package:ai_guaridan_app/presentation/guardian_screen/guardian_screen.dart';
import 'package:ai_guaridan_app/presentation/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> with SingleTickerProviderStateMixin{

  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton.icon(
        icon:  Icon(
          Icons.video_camera_back,
          color: ColorConstants.whiteColor,
        ),
           label:  Text(
             'SOS',
             style: TextStyle(
                 color: ColorConstants.whiteColor,
               fontWeight: FontWeight.w400
             ),
           ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.logoColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstants.themeColor,
        elevation: 0,
        // title: Text(
        //     'AI GUARDIAN',
        //   style: TextStyle(
        //     color: ColorConstants.whiteColor,
        //     fontSize: 16.0
        //   ),
        // ),
        bottom: TabBar(
            controller: tabController,
            unselectedLabelColor: ColorConstants.guardianColor,
            dividerHeight: 0,
            indicatorColor: ColorConstants.logoColor,
            labelStyle: TextStyle(
              fontSize: 16.0,
              color: ColorConstants.logoColor,
              fontWeight: FontWeight.w500
            ),
            tabs: [
          Tab(
            text: 'Cams',
            // icon: Icon(
            //   Icons.video_label_outlined,
            //   color: Colors.indigo.shade500,
            // ),
          ),
          Tab(
              text: 'AI Guard',
              // icon: Icon(
              //   Icons.privacy_tip,
              //   color: Colors.indigo.shade500,
              // )
          ),
          Tab(
              text: 'Settings',
              // icon: Icon(
              //   Icons.star,
              //   color: Colors.indigo.shade500,
              // )
          ),
        ]),
      ),
        body: TabBarView(controller: tabController, children: [
          CameraScreen(
            // tabController: tabController,
          ),
          GuardianScreen(
            // tabController: tabController,
          ),
          SettingsScreen(
            // tabController: tabController,
          ),
        ]));
  }
}
