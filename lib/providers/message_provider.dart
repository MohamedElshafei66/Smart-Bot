import 'package:flutter/cupertino.dart';
import '../models/chat_messages.dart';
import '../services/api.dart';

class MessageProvider with ChangeNotifier{
  List<ChatMessages> chatList = [];
  List<ChatMessages> get getMessages {
    return chatList;
  }
  void sendMessage({required String message}){
    chatList.add(ChatMessages(msg:message, msgIndex:0));
    notifyListeners();
  }
  Future<void> recieveMessageFormBot({required String message,required String choosenModel})async{
    chatList.addAll(
        await Api.getMessages(
        message:message,
        modelId:choosenModel
    )
    );
    notifyListeners();
  }
}