import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smart_chat/providers/message_provider.dart';
import 'package:smart_chat/providers/model_provider.dart';
import 'package:smart_chat/utils/app_color.dart';
import 'package:smart_chat/utils/app_sized.dart';
import 'package:smart_chat/utils/app_string.dart';
import 'package:smart_chat/utils/app_styles.dart';
import 'package:smart_chat/widgets/chat_textFeild.dart';
import 'package:smart_chat/widgets/custom_chat.dart';
class CustomBody extends StatefulWidget {
  const CustomBody({super.key});
  @override
  State<CustomBody> createState() => _CustomBodyState();
}
class _CustomBodyState extends State<CustomBody> {
  late ScrollController scrollController;
  late TextEditingController controller;
  late FocusNode focusNode;
  bool isLoading =false;
  @override
  void initState() {
   scrollController = ScrollController();
   controller = TextEditingController();
   focusNode = FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    scrollController.dispose();
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ModelProvider>(context);
    final chatProvider  = Provider.of<MessageProvider>(context);
    return Column(
      mainAxisAlignment:MainAxisAlignment.end,
      children:[
        Flexible(
          child: ListView.builder(
            controller:scrollController,
            itemCount:chatProvider.getMessages.length,
            itemBuilder:(context , i){
              return CustomChat(
                meg:chatProvider.getMessages[i].msg,
                indexMessage:chatProvider.getMessages[i].msgIndex,
                //this to prevent animation in message that we already have it
                animatedText:chatProvider.getMessages.length -1 == i,
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
              controller: controller,
              onPressed:()async{
                await sendMessage(
                    modelProvider: modelProvider,
                    messageProvider:chatProvider,
                );
              },
              onSubmitted:(val)async{
                await sendMessage(
                    modelProvider: modelProvider,
                    messageProvider:chatProvider,
                );
              },
          )
      ],
    );
  }
  Future<void> sendMessage({required ModelProvider modelProvider,required MessageProvider messageProvider})async{
    //assign this variable to get good response form bot
    String message = controller.text;
    //to avoid sending two message together
    if(isLoading){
      return;
    }
    if(controller.text.isEmpty){
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
             content:Text(
               AppString.snakBarText,
               style:AppStyles.normal20.copyWith(
                 color:AppColor.whiteColor
               )
             ),
             backgroundColor:AppColor.scaffoldColor,
             duration:Duration(
               seconds:2
             ),
             shape:RoundedRectangleBorder(
               borderRadius:BorderRadius.circular(5)
             )
         )
       );
       return;
    }
    try{
      setState(() {
        isLoading = true;
        //to show message that you send
        messageProvider.sendMessage(message:message);
        //to the text that you enter in chat
        controller.clear();
        //to hide keyboard after send a message

      }
      );
      //to show message that bot send
    await messageProvider.recieveMessageFormBot(
         message:message,
         choosenModel:modelProvider.getCurrentModel
     );
   setState((){});
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:Text(
                  "$e",
                  style:AppStyles.normal20.copyWith(
                      color:AppColor.whiteColor
                  )
              ),
              backgroundColor:AppColor.scaffoldColor,
              duration:Duration(
                  seconds:2
              ),
              shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(5)
              )
          )
      );
      print("Error is :$e");
    }finally{
      setState(() {
        myScrollToEnd();
        isLoading = false;
      });
    }
  }
  void myScrollToEnd(){
    scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration:Duration(milliseconds:3),
        curve:Curves.bounceIn
    );
  }
}
