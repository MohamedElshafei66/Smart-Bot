import 'package:flutter/cupertino.dart';
import 'package:smart_chat/services/api.dart';
import '../models/chat_models.dart';

class ModelProvider with ChangeNotifier{
  List<ChatModels> chatModels = [];
  String currentModel = "whisper-1";

  List<ChatModels> get getModels{
    return chatModels;
  }
  String get getCurrentModel{
    return currentModel;
  }
  void setCurrentModel(String newModel){
    currentModel = newModel;
    notifyListeners();
  }

  Future<List<ChatModels>> getAllModels()async{
  return  chatModels = await Api.getModels();
  }
}