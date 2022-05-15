import 'package:flutter/material.dart';
import 'package:things_to_do/view/home_screen/home_screen.dart';
import 'package:things_to_do/view/login_screen/login_screen.dart';
import 'package:things_to_do/view/tasks_screens/done_task/done_task_screen.dart';
import 'package:things_to_do/view/tasks_screens/important_tasks/important_tasks_screen.dart';
import 'package:things_to_do/view/tasks_screens/later_tasks/later_task_screen.dart';
import 'package:things_to_do/view/tasks_screens/new_task/new_task_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const LoginScreen(),
  HomeScreen.screenRoute: (context) => const HomeScreen(),
  NewTaskScreen.screenRoute: (context) => const NewTaskScreen(),
  ImportantTaskScreen.screenRoute: (context) => const ImportantTaskScreen(),
  DoneTaskScreen.screenRoute: (context) => const DoneTaskScreen(),
  LaterTaskScreen.screenRoute: (context) => const LaterTaskScreen(),
};
