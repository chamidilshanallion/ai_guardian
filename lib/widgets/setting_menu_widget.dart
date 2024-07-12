import 'package:ai_guaridan_app/constants/constants.dart';
import 'package:flutter/material.dart';

class SettingMenuWidget extends StatelessWidget {
  const SettingMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: ColorConstants.guardianColor)
      ),
      child: ListTile(
        onTap: onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: ColorConstants.whiteColor,
          ),
          child: Icon(icon,
              // color: iconColor
          ),
        ),
        title: Text(
            title,
            style: TextStyle(
              color: ColorConstants.whiteColor,
            ),),
        trailing: endIcon? Container(
            width: 30,
            height: 30,
            child:  Icon(Icons.chevron_right, size: 18.0, color: ColorConstants.whiteColor)) : null,
      ),
    );
  }
}