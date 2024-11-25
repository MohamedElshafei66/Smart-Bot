import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_chat/models/chat_models.dart';
import 'package:smart_chat/providers/model_provider.dart';
import 'package:smart_chat/utils/app_sized.dart';
import 'package:smart_chat/utils/app_string.dart';
import 'package:smart_chat/utils/app_styles.dart';
import '../utils/app_color.dart';
class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? currentModel;
  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ModelProvider>(context,listen:false);
    currentModel = modelProvider.currentModel;
    return FutureBuilder<List<ChatModels>>(
        future:modelProvider.getAllModels(),
        builder:(context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text(
              AppString.loadText,
              style:AppStyles.medium20.copyWith(
                color:AppColor.whiteColor
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              return DropdownButton(
                  padding:EdgeInsets.only(right:AppSized.size50),
                  iconEnabledColor:AppColor.whiteColor,
                  isExpanded:true,
                  dropdownColor:AppColor.scaffoldColor,
                  items:List<DropdownMenuItem<String>>.generate(
                      snapshot.data!.length,
                          (i) => DropdownMenuItem(
                          value:snapshot.data![i].id,
                          child:FittedBox(
                            child: Text(
                                snapshot.data![i].id,
                                style:AppStyles.semiBold20.copyWith(
                                    color:AppColor.whiteColor
                                )
                            ),
                          )
                      )
                  ),
                  value:currentModel,
                  onChanged:(val){
                    setState(() {
                      currentModel = val.toString();
                    });
                    modelProvider.setCurrentModel(val.toString());
                  }
              );
            }
            if(snapshot.hasError){
              return Text(
                AppString.errorText
              );
            }
          }
          return Text("");

        }
    );
  }
}
 /*DropdownButton(
        dropdownColor:AppColor.scaffoldColor,
        items:DropDownItemsModel().dropDownItem,
        value:currentModel,
        onChanged:(val){
          setState(() {
            currentModel = val.toString();
          });
        }
    );*/