import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/components/global_widgets/custom_cancel_button.dart';
import 'package:todo_app/core/components/local_widgets/task_card.dart';
import 'package:todo_app/core/constants/colors_constants.dart';
import 'package:todo_app/core/constants/string_constants.dart';
import 'package:todo_app/views/home_screen/home_view_model.dart';

class FAB_Button extends StatelessWidget {
  final TabController tabController;

  const FAB_Button({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: ColorConstants.instance.green,
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: ColorConstants.instance.white,
          context: context,
          isScrollControlled: true,
          builder: (context) {
            String newTask = '';
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: DraggableScrollableSheet(
                initialChildSize: 0.3,
                maxChildSize: 0.8,
                expand: false,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            onChanged: (value) {
                              newTask = value;
                            },
                            decoration: const InputDecoration(
                              labelText: StringConstants.enter,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Divider(
                            color: ColorConstants.instance.gray,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              cancelButton(),
                              SizedBox(width: 10.w),
                              ElevatedButton(
                                onPressed: () {
                                  if (newTask.isNotEmpty) {
                                    Provider.of<HomeViewModel>(context, listen: false)
                                        .addTask(newTask, tabController.index);
                                    Navigator.pop(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorConstants.instance.green,
                                ),
                                child: Text(
                                  StringConstants.add,
                                  style: TextStyle(
                                    color: ColorConstants.instance.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
      child: Icon(Icons.add, color: ColorConstants.instance.white),
    );
  }
}

class taskListView extends StatelessWidget {
  const taskListView({
    super.key,
    required this.tasks,
  });

  final List<String> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskCard(
          task: tasks[index], 
          onDismissed: () { 
            Provider.of<HomeViewModel>(context, listen: false)
                .removeTask(index, tasks);
           },
        );
      },
    );
  }
}