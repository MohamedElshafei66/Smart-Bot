import 'package:flutter/material.dart';
import 'package:smart_chat/utils/app_string.dart';
import 'package:smart_chat/utils/app_styles.dart';
import '../utils/app_color.dart';
class CustomTextfeild extends StatelessWidget {
  const CustomTextfeild({super.key,required this.controller,required this.onSubmitted,required this.focusNode});
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode:focusNode,
      controller:controller,
      cursorColor:AppColor.whiteColor,
      style:AppStyles.normal22,
      decoration:InputDecoration(
          hintText:AppString.hintText,
          hintStyle:AppStyles.normal20,
          filled:true,
          fillColor:AppColor.appbarColor,
          focusedBorder:OutlineInputBorder(
              borderSide:BorderSide.none
          ),
          enabledBorder:OutlineInputBorder(
              borderSide:BorderSide.none
          )
      ),
      onSubmitted:onSubmitted,
    );
  }
}
