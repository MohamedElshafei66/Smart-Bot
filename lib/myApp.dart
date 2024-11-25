import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_chat/providers/model_provider.dart';
import 'package:smart_chat/screens/splash_screen.dart';
import 'package:smart_chat/utils/app_color.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
        create:(context)=>ModelProvider(),
        child:MaterialApp(
          debugShowCheckedModeBanner:false,
          home:const SplashScreen(),
          theme:ThemeData(
              scaffoldBackgroundColor:AppColor.scaffoldColor,
              appBarTheme:const AppBarTheme(
                  color:AppColor.appbarColor
              )
          ),
        )
    );
  }
}