import 'package:flutter/material.dart';
import 'package:todo_app/core/base/base_view_model.dart';
import 'package:todo_app/core/constants/string_constants.dart';

class HomeViewModel extends BaseViewModel {
  bool isInit = false;

  List<String> todayTasks = [];
  List<String> tomorrowTasks = [];
  List<String> restTasks = [];
  List<String> laterTasks = [];


  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }

  static const List<Widget> tabs = [
    Tab(text: StringConstants.today),
    Tab(text: StringConstants.tomorrow),
    Tab(text: StringConstants.rest),
    Tab(text: StringConstants.later),
  ];

  void addTask(String task, int index) {
    switch (index) {
      case 0:
        todayTasks.add(task);
        break;
      case 1:
        tomorrowTasks.add(task);
        break;
      case 2:
        restTasks.add(task);
        break;
      case 3:
        laterTasks.add(task);
        break;
    }
    notifyListeners();
  }

  void removeTask(int index, List<String> tasks) {
    tasks.removeAt(index);
    notifyListeners();
  }
}