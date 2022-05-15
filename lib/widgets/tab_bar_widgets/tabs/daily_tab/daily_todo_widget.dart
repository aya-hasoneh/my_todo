// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:things_to_do/singleton/singleton.dart';

import '/main.dart';
import '/models/task.dart';
import '/widgets/tab_bar_widgets/sections/tasks_list_section.dart';
import '/widgets/tab_bar_widgets/sections/all_tasks_done_section.dart';
import '/widgets/tab_bar_widgets/sections/completed_tasks_section.dart';

class DailyTODOScreen extends StatefulWidget {
  const DailyTODOScreen({Key? key}) : super(key: key);

  @override
  State<DailyTODOScreen> createState() => _DailyTODOScreenState();
}

class _DailyTODOScreenState extends State<DailyTODOScreen> {
  Size? screenSize = null;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    final base = BaseWidget.of(context);

    return StreamBuilder(
        stream: Singleton.instance.mainCollection.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return snapshot.hasData
              ? showListFromFirebase(snapshot)
              : ValueListenableBuilder(
                  valueListenable: base.dataStore.listenToTasks(),
                  builder: (BuildContext context, Box<Task> box, Widget? child) {
                    var tasks = box.values.toList();
                    tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));

                    tasks = tasks
                        .where(
                          (element) => element.taskFinalDate.day == DateTime.now().day && element.taskFinalDate.month == DateTime.now().month && element.taskFinalDate.year == DateTime.now().year,
                        )
                        .toList();

                    return ListView(
                      padding: const EdgeInsets.all(0),
                      children: [
                        // --
                        CompletedTasksSection(tasks),

                        // --
                        (tasks.isNotEmpty) ? TasksListSection(tasks, screenSize!) : AllTasksDoneSection(screenSize!),
                      ],
                    );
                  },
                );
        });
  }

  Widget showListFromFirebase(AsyncSnapshot<QuerySnapshot> snapshot) {
    List<QueryDocumentSnapshot<Object?>> itemsList = snapshot.data!.docs;
    List<Task> tasks = [];

    for (var item in itemsList) {
      print(item["createdAt"]);
      var task = Task(
          id: "1", //item["id"],
          createdAt: DateTime.fromMillisecondsSinceEpoch(item["createdAt"]),
          taskTitle: item["taskTitle"],
          taskCategory: item["taskCategory"],
          isFavorite: item["isFavorite"],
          taskDesc: item["taskDesc"],
          taskColor: item["taskColor"],
          taskFinalDate: DateTime.fromMillisecondsSinceEpoch(item["taskFinalDate"]),
          isDone: item["isDone"],
          isLater: item["isLater"],
          notification: item["notification"]);

      tasks.add(task);
    }

    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        CompletedTasksSection(tasks),
        AllTasksDoneSection(screenSize!),
      ],
    );
  }
}
