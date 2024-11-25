import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smart_chat/providers/model_provider.dart';
import 'package:smart_chat/services/api.dart';
import 'package:smart_chat/utils/app_color.dart';
import 'package:smart_chat/utils/app_sized.dart';
import 'package:smart_chat/widgets/chat_textFeild.dart';
import 'package:smart_chat/widgets/custom_chat.dart';
import '../models/chat_messages.dart';
class CustomBody extends StatefulWidget {
  const CustomBody({super.key});
  @override
  State<CustomBody> createState() => _CustomBodyState();
}
class _CustomBodyState extends State<CustomBody> {
  late TextEditingController controller;
  late FocusNode focusNode;
  bool isLoading =false;
  List<ChatMessages> chatList = [];
  @override
  void initState() {
   controller = TextEditingController();
   focusNode = FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ModelProvider>(context);
    return Column(
      mainAxisAlignment:MainAxisAlignment.end,
      children:[
        Flexible(
          child: ListView.builder(
            itemCount:chatList.length,
            itemBuilder:(context , i){
              return CustomChat(
                meg:chatList[i].msg,
                indexMessage:chatList[i].msgIndex,
              );
            },
          ),
        ),
        if(isLoading) ...[
          SpinKitThreeBounce(
            color:AppColor.whiteColor,
            size:20,
          ),
        ],
          SizedBox(
            height:AppSized.size20,
          ),
          ChatTextfeild(
              focusNode:focusNode,
              controller: controller,
              onPressed:()async{
                await sendMessage(modelProvider: modelProvider);
              },
              onSubmitted:(val)async{
                await sendMessage(modelProvider: modelProvider);
              },
          )
      ],
    );
  }
  Future<void> sendMessage({required ModelProvider modelProvider })async{
    try{
      setState(() {
        isLoading = true;
        //to show message that you send
        chatList.add(ChatMessages(msg:controller.text, msgIndex:0));
        //to the text that you enter in chat
        controller.clear();
        //to hide keyboard after send a message
        focusNode.unfocus();
      }
      );
   chatList.addAll(
       await Api.getMessages(
           message:controller.text,
           modelId:modelProvider.getCurrentModel
       )
   );
   setState((){});
    }catch(e){
      print("Error is :$e");
    }finally{
      setState(() {
        isLoading = false;
      });
    }
  }
}
