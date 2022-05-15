// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:things_to_do/view/login_screen/login_screen.dart';

import '/main.dart';
import '/models/task.dart';
import '/utils/colors.dart';
import '/widgets/shared_widgets/search_text_field.dart';
import '/view/tasks_screens/new_task/new_task_screen.dart';
import '/view/tasks_screens/edit_task/edit_task_screen.dart';

class TaskDetailsScreen extends StatelessWidget {
  static const screenRoute = 'taskDetailScreen';

  TaskDetailsScreen(this.tasks, this.task, this.size, {Key? key}) : super(key: key);

  List<Task> tasks;
  Task task;
  Size size;

  @override
  Widget build(BuildContext context) {
    final base = BaseWidget.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          toolbarHeight: 60,
          title: const Text("Task Details"),
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
        body: Stack(
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              color: ThemeColors.primaryColor,
              child: const CustomSearchWidget(),
            ),
            Container(
              height: 380,
              width: size.width,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: ThemeColors.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.taskTitle,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Text(
                  //   "${DateFormat.yMMMd().format(task.taskFinalDate)} | ${DateFormat('kk:mm a').format(task.createdAt)}",
                  //   style: const TextStyle(
                  //     fontSize: 14,
                  //     color: ThemeColors.lightGreyColor,
                  //   ),
                  // ),
                  const SizedBox(height: 14),
                  Text(
                    task.taskDesc,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ThemeColors.greyColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        "Category: ",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        task.taskCategory,
                        style: const TextStyle(fontSize: 14, color: ThemeColors.greyColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: size.width,
          height: 70,
          color: ThemeColors.whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  base.dataStore.deleteTask(task: task);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.delete_outline),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditTakScreen(tasks, task, size)));
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  // TODO
                  // Navigator.pushNamed(context, EditTakScreen.screenRoute);
                },
                icon: const Icon(Icons.schedule),
              ),
              IconButton(
                onPressed: () {
                  base.dataStore.updateTask(task: task);
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.assignment_turned_in_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
