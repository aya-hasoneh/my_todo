import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '/main.dart';
import '/models/task.dart';
import '/utils/colors.dart';
import '/widgets/tab_bar_widgets/sections/tasks_list_section.dart';
import '/widgets/tab_bar_widgets/sections/all_tasks_done_section.dart';

class WeeklyTODOScreen extends StatelessWidget {
  const WeeklyTODOScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
      valueListenable: base.dataStore.listenToTasks(),
      builder: (BuildContext context, Box<Task> box, Widget? child) {
        Task? task;
        var tasks = box.values.toList();
        var sortByDays = box.values.toList();
        // tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        // sortByDays.sort((a, b) => a.createdAt.compareTo(b.taskFinalDate));

        // tasks = tasks
        //     .where(
        //       (element) => element.taskFinalDate.day < element.createdAt.day + 7 && element.taskFinalDate.day >= element.createdAt.day,
        //     )
        //     .toList();

        // Task task;
        // DateTime taskIndex(Task task) {
        //   for (int i = 0; i < tasks.length; i++) {
        //     if (tasks[i] == task) {
        //       return task.taskFinalDate;
        //     }
        //   }
        //     return DateTime.now();
        // }

        return ListView(
          padding: const EdgeInsets.all(0),
          children: [
            // --
            SizedBox(
              height: 110,
              child: SfCalendar(
                view: CalendarView.week,
                timeSlotViewSettings: const TimeSlotViewSettings(
                  startHour: 0,
                  endHour: 0,
                ),
                viewNavigationMode: ViewNavigationMode.snap,
                initialDisplayDate: DateTime.now(),
                headerHeight: 45,
                headerDateFormat: "MMM, yyy",
                headerStyle: const CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  backgroundColor: ThemeColors.whiteColor,
                  textStyle: TextStyle(color: ThemeColors.blackColor, fontSize: 20),
                ),
                cellBorderColor: ThemeColors.primaryColor,
                backgroundColor: ThemeColors.primaryColor,
                todayHighlightColor: ThemeColors.whiteColor,
                showDatePickerButton: false,
                todayTextStyle: const TextStyle(
                  color: ThemeColors.blackColor,
                ),
              ),
            ),

            // --

            // sortByDays  ?

            (tasks.isNotEmpty)
                ? Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        alignment: Alignment.center,
                        // DateFormat.yMMMd().format(DateTime.now()
                        child: Text("Today",

                            // TODO: ___

                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: ThemeColors.primaryColor,
                            )),
                      ),
                      TasksListSection(tasks, size),
                    ],
                  )
                : AllTasksDoneSection(size),
          ],
        );
      },
    );
  }
}
