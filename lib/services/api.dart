import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_chat/models/chat_models.dart';
import 'package:smart_chat/services/links.dart';
import '../models/chat_messages.dart';
class Api{
  static Future<List<ChatModels>>   getModels()async{
    try{
      var response = await http.get(
        Uri.parse("${Links.baseUrl}/models"),
        headers:{
          "Authorization" : "Bearer ${Links.myKey}"
        }
      );
      var responseBody = jsonDecode(response.body);
      if(responseBody['error'] != null){
        print(responseBody['error']['message']);
        throw HttpException("Error is:- ${responseBody['error']['message']}");
      }
      List tmp = [];
      for(var value in responseBody["data"]){
        tmp.add(value);
      }
      return ChatModels.modelsFromSnapShot(tmp);
    }catch(e){
      print("Error is:- $e");
      rethrow;
    }
  }
  static Future<List<ChatMessages>> getMessages({required String message , required String modelId})async{
    try{
      var response = await http.post(
          Uri.parse("${Links.baseUrl}/completions"),
          headers:{
            "Authorization" : "Bearer ${Links.myKey}",
            "Content-Type"  : "application/json"
          },
          body:jsonEncode(
              {
                "model": modelId,
                "prompt": message,
                "max_tokens": 100,
              }
          )
      );
      var responseBody = jsonDecode(response.body);
      if(responseBody['error'] != null){
        print(responseBody['error']['message']);
        throw HttpException("Error is:- ${responseBody['error']['message']}");
      }
      List<ChatMessages> messages = [];
      if(responseBody["choices"].length > 0){
        messages = List.generate(
            responseBody["choices"].length,
            (i)=>ChatMessages(
                msg:responseBody["choices"][i]["text"],
                msgIndex:1
            )
        );
      }
      return messages;
    }catch(e){
      print("Error is:- $e");
      rethrow;
    }
  }
}