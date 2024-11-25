import 'package:flutter/material.dart';
import 'package:smart_chat/utils/app_color.dart';
import 'package:smart_chat/utils/app_sized.dart';
import 'package:smart_chat/utils/app_string.dart';
import 'package:smart_chat/utils/app_styles.dart';
import '../utils/app_images.dart';
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppbar({super.key,required this.onPressed});
   final void Function()? onPressed;
   Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:Padding(
        padding: const EdgeInsets.only(left:AppSized.size5),
        child: Image(
          image:AssetImage(AppImages.chatLogo),
        ),
      ),
      title:Text(
          AppString.chatBot,
          style:AppStyles.medium25
      ),
      actions:[
        IconButton(
          onPressed:onPressed,
          icon:Icon(
            Icons.more_vert_outlined,
            color:AppColor.whiteColor,
            size:30,
          ),
        )
      ],
    );
  }
}
