import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors_constants.dart';
import 'package:todo_app/core/constants/string_constants.dart';

class cancelButton extends StatelessWidget {
  const cancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.instance.white,
      ),
      child: Text(
        StringConstants.cancel,
        style: TextStyle(
          color: Colors.red,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}