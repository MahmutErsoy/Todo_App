import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/assets_constants.dart';
import 'package:todo_app/core/constants/colors_constants.dart';
import 'package:todo_app/core/constants/string_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(48.sp);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.instance.appbar,
      centerTitle: true,
      title: Text(
        StringConstants.app,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      actions: [
        Container(
        width: 38.0.w,
        height: 30.0.h,
        decoration:  BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(AssetsConstants.profile),
              fit: BoxFit.fill,
              repeat: ImageRepeat.repeat,
            ),
            borderRadius: BorderRadius.all(Radius.circular(18.sp))),
        child: Container(
          width: 18.0.w,
          height: 18.0.h,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        ),
        SizedBox(width: 10.0.w,)
      ],
    );
  }
}