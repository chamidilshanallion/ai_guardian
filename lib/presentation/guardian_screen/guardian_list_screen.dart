import 'package:ai_guaridan_app/presentation/guardian_screen/add_guardian_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/guardian_model.dart';
import '../camera_screen/new_camera_screen.dart';

class GuardianListScreen extends StatefulWidget {
  @override
  _GuardianListScreenState createState() => _GuardianListScreenState();
}

class _GuardianListScreenState extends State<GuardianListScreen> {
  List<Guardian> guardians = [
    Guardian(name: 'John Doe', type: 'Family Member', imageUrl: 'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG.png'),
    Guardian(name: 'Jane Smith', type: 'Neighbor',
        imageUrl:'https://cdn.vectorstock.com/i/1000v/51/87/student-avatar-user-profile-icon-vector-47025187.avif'),
    Guardian(name: 'Officer Jones', type: 'Police Officer', imageUrl: 'https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png'),
  ];

  void _addGuardian() {
    // Implement add guardian functionality here
  }

  void _showAddCameraBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddGuardianPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(
        title: Text(
            'My Guardians',
          style: TextStyle(
            color: ColorConstants.whiteColor,
            fontSize: 18.0,
            fontWeight: FontWeight.w500
          ),
        ),
       actions: [
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: IconButton(
             icon: Icon(Icons.add),
             onPressed: (){
               _showAddCameraBottomSheet(context);
             },
             color: ColorConstants.whiteColor,
           ),
         )
       ], 
        centerTitle: false,
        backgroundColor: ColorConstants.themeColor,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: guardians.length,
        itemBuilder: (context, index) {
          final guardian = guardians[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(guardian.imageUrl),
            ),
            title: Text(
                guardian.name,
              style: TextStyle(
                color: ColorConstants.whiteColor
              ),
            ),
            subtitle: Text(
                guardian.type,
              style: TextStyle(
                  color: Color(0xFF9EABB8)
              ),
            ),
          );
        },
      ),
    );
  }
}