import 'package:ai_guaridan_app/constants/constants.dart';
import 'package:ai_guaridan_app/presentation/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      body:  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 340.0,
                height: 411.0,
              ),
              Text(
                'Explore, Secure, and Thrive',
                style: TextStyle(
                  color: ColorConstants.logoColor,
                  fontSize: 20.0
                ),
              ),
              Text(
                'Experience the future of digital protection with us',
                style: TextStyle(
                  color: ColorConstants.whiteColor,
                  fontSize: 14.0
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 51.0,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.logoColor
                  ),
                    child: Text(
                        'Get Started Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),
                    ),

                ),
              )
            ],
        ),
      ),
    );
  }
}
