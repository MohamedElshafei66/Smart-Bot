import 'package:flutter/material.dart';
import 'package:smart_chat/utils/app_sized.dart';
import 'package:smart_chat/utils/app_string.dart';
import 'package:smart_chat/utils/app_styles.dart';
import 'package:smart_chat/widgets/drop_down.dart';
import '../utils/app_color.dart';

class ShowBottomSheet{
  static showModelBottomSheet({required BuildContext context}){
    return showModalBottomSheet(
        context: context,
        builder:(context){
          return Container(
            height:70,
            decoration:BoxDecoration(
                color:AppColor.scaffoldColor,
                borderRadius:BorderRadius.vertical(
                    top:Radius.circular(12)
                )
            ),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children:[
                Padding(
                  padding: const EdgeInsets.only(left:AppSized.size30),
                  child: Text(
                    AppString.modelText,
                    style:AppStyles.medium20
                  ),
                ),
                SizedBox(
                  width:AppSized.size15,
                ),
                Expanded(
                    child: DropDown()
                )
              ],
            ),
          );
        }
    );
  }
}