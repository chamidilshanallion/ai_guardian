import 'package:ai_guaridan_app/constants/constants.dart';
import 'package:flutter/material.dart';

class LiveCameraContainer extends StatelessWidget {
  final String imageUrl;
  const LiveCameraContainer({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0)
            ),
            height: 173.0,
            width: 173.0,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Camera 1',
          style: TextStyle(
            color: ColorConstants.whiteColor,
            fontSize: 16.0
          ),
        ),

        Text(
          'Living room',
          style: TextStyle(
            color: Color(0xFF9EABB8),
            fontSize: 14.0,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),


      ],
    );
  }
}

