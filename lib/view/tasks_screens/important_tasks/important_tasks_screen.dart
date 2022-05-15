import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/main.dart';
import '/models/task.dart';
import '/utils/colors.dart';
import '/widgets/shared_widgets/search_text_field.dart';
import '/view/tasks_screens/new_task/new_task_screen.dart';
import '/widgets/tab_bar_widgets/sections/all_tasks_done_section.dart';
import '/widgets/tab_bar_widgets/sections/tasks_list_section.dart';

class ImportantTaskScreen extends StatelessWidget {
  static const screenRoute = 'importantTaskScreen';

  const ImportantTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
      valueListenable: base.dataStore.listenToTasks(),
      builder: (BuildContext context, Box<Task> box, Widget? child) {
        var tasks = box.values.toList();
        // tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        //TODO
        tasks = tasks.where((element) => element.isFavorite == true).toList();

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            toolbarHeight: 60,
            title: const Text("Important Tasks"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_active),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, NewTaskScreen.screenRoute);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                color: ThemeColors.primaryColor,
                child: const CustomSearchWidget(),
              ),
              // --
              (tasks.isNotEmpty) ? TasksListSection(tasks, size) : AllTasksDoneSection(size),
            ],
          ),
        );
      },
    );
  }
}
