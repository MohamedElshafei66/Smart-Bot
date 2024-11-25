import 'package:flutter/material.dart';
import '../screens/chat_screen.dart';
import '../utils/app_color.dart';
import '../utils/app_sized.dart';
import '../utils/app_string.dart';
import '../utils/app_styles.dart';
class SplashButton extends StatelessWidget {
  const SplashButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
          return ChatScreen();
        }));
      },
      child: Container(
        width:300,
        height:60,
        decoration:BoxDecoration(
            color:AppColor.buttonColor,
            borderRadius:BorderRadius.circular(AppSized.size20),
            border:Border.all(
                color:Colors.transparent
            )
        ),
        child:Center(
          child: Text(
              AppString.buttonText,
              style:AppStyles.semiBold28
          ),
        ),
      ),
    );
  }
}
