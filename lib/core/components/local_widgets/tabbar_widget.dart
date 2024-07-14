import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/constants/colors_constants.dart';
import 'package:todo_app/views/home_screen/home_view_model.dart';

class TabBarWidget extends StatelessWidget {
  final TabController tabController;

  const TabBarWidget({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0.h,
      alignment: Alignment.center,
      child: TabBar(
        controller: tabController,
        labelColor: ColorConstants.instance.green,
        indicatorColor: ColorConstants.instance.green,
        unselectedLabelColor: ColorConstants.instance.tabText,
        isScrollable: true,
        tabs: HomeViewModel.tabs,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0.sp,
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}