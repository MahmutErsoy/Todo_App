import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/core/components/global_widgets/custom_cancel_button.dart';
import 'package:todo_app/core/constants/colors_constants.dart';
import 'package:todo_app/core/constants/string_constants.dart';

class TaskCard extends StatefulWidget {
  final String task;
  final VoidCallback onDismissed;

  const TaskCard({
    Key? key,
    required this.task,
    required this.onDismissed,
  }) : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _isChecked = false;
  String? _tag;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.task),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              _showDeleteDialog(context);
            },
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.red,
            icon: Icons.delete,
            label: StringConstants.delete,
            spacing: 0, 
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        margin:  EdgeInsets.symmetric(vertical: 8.0.sp, horizontal: 16.0.sp),
        child: Card(
          elevation: 7.0,
          color: ColorConstants.instance.white,
          child: Padding(
            padding:  EdgeInsets.all(16.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        widget.task,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: _isChecked ? ColorConstants.instance.gray : ColorConstants.instance.tundora,
                          decoration: _isChecked ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0.h),
                if (_tag == null)
                  TextButton(
                    onPressed: () {
                      _showAddTagDialog(context);
                    },
                    child:  Text(
                      StringConstants.tagAdd,
                      style: TextStyle(color: ColorConstants.instance.cornflowerBlue),
                    ),
                  )
                else
                  Container(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.sp, vertical: 4.0.sp),
                    decoration: BoxDecoration(
                      color: ColorConstants.instance.cornflowerBlue,
                      borderRadius: BorderRadius.circular(4.0.r),
                    ),
                    child: Text(
                      _tag!,
                      style:  TextStyle(color: ColorConstants.instance.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(StringConstants.taskDelete),
          content:  Text(StringConstants.deleteMessage, style: Theme.of(context).textTheme.displayMedium),
          actions: [
            cancelButton(),
            ElevatedButton(
              onPressed: () {
                widget.onDismissed();
                Navigator.of(context).pop(); 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                StringConstants.delete,
                style: TextStyle(
                  color: ColorConstants.instance.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAddTagDialog(BuildContext context) {
    final TextEditingController _tagController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text(StringConstants.tagAdd, style: TextStyle(color: ColorConstants.instance.tundora),),
          content: TextField(
            controller: _tagController,
            decoration: const InputDecoration(
              hintText: StringConstants.tagEnter,
              labelText: StringConstants.enter,
            ),
          ),
          actions: [
            cancelButton(),
            tagAddButton(_tagController, context),
          ],
        );
      },
    );
  }

  ElevatedButton tagAddButton(TextEditingController _tagController, BuildContext context) {
    return ElevatedButton(
            onPressed: () {
              setState(() {
                _tag = _tagController.text;
              });
              Navigator.of(context).pop(); 
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
          );
  }
}