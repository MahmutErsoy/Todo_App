import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/base/base_view.dart';
import 'package:todo_app/core/components/global_widgets/app_bar.dart';
import 'package:todo_app/core/components/local_widgets/tabbar_widget.dart';
import 'package:todo_app/views/home_screen/home_view_model.dart';
import 'package:todo_app/views/home_screen/home_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: HomeViewModel.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: Provider.of<HomeViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: CustomAppBar(),
          body: SafeArea(
            child: Column(
              children: [
                TabBarWidget(tabController: _tabController),
                Expanded(
                  child: Consumer<HomeViewModel>(
                    builder: (context, value, child) => TabBarView(
                      controller: _tabController,
                      children: [
                        taskListView(tasks: viewModel.todayTasks),
                        taskListView(tasks: viewModel.tomorrowTasks),
                        taskListView(tasks: viewModel.restTasks),
                        taskListView(tasks: viewModel.laterTasks),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FAB_Button(tabController: _tabController),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}



