import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import '/main.dart';
import '/models/task.dart';
import '/utils/colors.dart';
import '/widgets/tab_bar_widgets/sections/tasks_list_section.dart';
import '/widgets/tab_bar_widgets/sections/all_tasks_done_section.dart';

class MonthlyTODOScreen extends StatelessWidget {
  const MonthlyTODOScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
      valueListenable: base.dataStore.listenToTasks(),
      builder: (BuildContext context, Box<Task> box, Widget? child) {
        var tasks = box.values.toList();
        // tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        // tasks = tasks
        //     .where(
        //       (element) => element.taskFinalDate.day > element.createdAt.weekday,
        //     )
        //     .toList();

        return ListView(
          padding: const EdgeInsets.all(0),
          children: [
            // --
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.now(),
              lastDay: DateTime(2100),
            ),

            // --
            (tasks.isNotEmpty) ? TasksListSection(tasks, size) : AllTasksDoneSection(size),
          ],
        );
      },
    );
  }
}
