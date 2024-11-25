import 'package:flutter/material.dart';
import 'package:smart_chat/widgets/bottom_sheet.dart';
import 'package:smart_chat/widgets/custom_appbar.dart';
import 'package:smart_chat/widgets/custom_body.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:CustomAppbar(
          onPressed:(){
            ShowBottomSheet.showModelBottomSheet(context: context);
          },
      ),
      body:CustomBody(),
    );
  }
}
