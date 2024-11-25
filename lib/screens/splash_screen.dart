import 'package:flutter/material.dart';
import 'package:smart_chat/utils/app_color.dart';
import 'package:smart_chat/utils/app_images.dart';
import 'package:smart_chat/utils/app_sized.dart';
import 'package:smart_chat/utils/app_string.dart';
import 'package:smart_chat/utils/app_styles.dart';
import 'package:smart_chat/widgets/splash_button.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.appbarColor,
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
          Center(
            child: Image(
              image:AssetImage(AppImages.splash2),
              width:350,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:AppSized.size10),
            child: Column(
              children:[
                Text(
                  textAlign:TextAlign.center,
                  AppString.Text1,
                  style:AppStyles.semiBold35
                ),
                SizedBox(
                  height:AppSized.size10,
                ),
                Text(
                  textAlign:TextAlign.center,
                  AppString.Text2,
                  style:AppStyles.semiBold20
                ),
              ],
            ),
          ),
          SizedBox(
            height:AppSized.size10,
          ),
          SplashButton()
        ],
      ),
    );
  }
}
