import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_chat/utils/app_color.dart';
import 'package:smart_chat/utils/app_images.dart';
import 'package:smart_chat/utils/app_sized.dart';
import 'package:smart_chat/utils/app_styles.dart';
class CustomChat extends StatelessWidget {
  const CustomChat({
    super.key,
    required this.meg,
    required this.indexMessage
  });
  final String meg;
  final int indexMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:indexMessage == 0 ?
      AppColor.scaffoldColor:
      AppColor.appbarColor,
      padding:EdgeInsets.all(AppSized.size10),
      child:Row(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:[
          Image(
            image:indexMessage == 0?
            AssetImage(AppImages.person) :
            AssetImage(AppImages.chatLogo),
            height:50,
            width:50,
          ),
          SizedBox(
            width:AppSized.size10,
          ),
          Expanded(
            child: Text(
              meg,
              style:AppStyles.normal22
            ),
          ),
          indexMessage == 0 ?
          SizedBox() :
          Row(
            mainAxisSize:MainAxisSize.min,
            children:[
              Icon(
                FontAwesomeIcons.thumbsUp,
                color:AppColor.whiteColor,
              ),
              SizedBox(
                width:AppSized.size8,
              ),
              Icon(
                FontAwesomeIcons.thumbsDown,
                color:AppColor.whiteColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
