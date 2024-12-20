import 'package:flutter/material.dart';
import 'package:smart_chat/utils/app_color.dart';
import 'custom_textFeild.dart';
class ChatTextfeild extends StatelessWidget {
  const ChatTextfeild({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.onSubmitted,
  });
  final TextEditingController controller;
  final void Function()? onPressed;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:AppColor.appbarColor,
      child:Row(
        children:[
          Expanded(
              child:CustomTextfeild(
                  controller: controller,
                  onSubmitted:onSubmitted
              )
          ),
          IconButton(
            onPressed:onPressed,
            icon:Icon(
              Icons.send,
              color:AppColor.whiteColor
            ),
          )
        ],
      ),
    );
  }
}
