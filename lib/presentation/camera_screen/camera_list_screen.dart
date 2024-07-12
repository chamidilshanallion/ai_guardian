import 'package:ai_guaridan_app/presentation/camera_screen/new_camera_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CameraListScreen extends StatefulWidget {
  @override
  _CameraListScreenState createState() => _CameraListScreenState();
}

class _CameraListScreenState extends State<CameraListScreen> {
  List<Map<String, String>> _cameras = [
    {
      'name': 'Living Room',
      'ip': '192.168.1.10',
      'image': 'assets/images/door.png',
    },
    {
      'name': 'Front Door',
      'ip': '192.168.1.11',
      'image': 'assets/images/room.png',
    },
    {
      'name': 'Backyard',
      'ip': '192.168.1.12',
      'image': 'assets/images/door.png',
    },
  ];

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
      appBar: AppBar(
        title: Text(
          'My Cameras',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: _cameras.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final camera = _cameras[index];

                return Dismissible(
                  key: Key(camera['ip']!),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      _cameras.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${camera['name']} deleted')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: Card(
                    child: ListTile(
                      leading: Image.asset(
                        camera['image']!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      title: Text(camera['name']!),
                      subtitle: Text(camera['ip']!),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}