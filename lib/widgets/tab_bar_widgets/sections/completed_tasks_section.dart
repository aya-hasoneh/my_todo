// ignore_for_file: must_be_immutable

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:things_to_do/view/login_screen/login_screen_bloc.dart';

import '/main.dart';
import '/models/task.dart';
import '/utils/colors.dart';
import '/singleton/singleton.dart';

class CompletedTasksSection extends StatefulWidget {
  CompletedTasksSection(this.tasksList, {Key? key}) : super(key: key);

  List<Task> tasksList;

  @override
  State<CompletedTasksSection> createState() => _CompletedTasksSectionState();
}

class _CompletedTasksSectionState extends State<CompletedTasksSection> {
  final LoginScreenBloc _bloc = LoginScreenBloc();

  late String name;

  @override
  void initState() {
    _bloc.storage;
    _bloc.getUserLoginInfo();
    name = _bloc.storage.read(key: "U").toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // --
    final base = BaseWidget.of(context);
    final box = base.dataStore.box;
    List<Task> tasks = box.values.toList();

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      height: 130,
      decoration: const BoxDecoration(
        color: ThemeColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                Singleton.instance.greeting(),
                style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
              ),
              Text(
                " Naser",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "TODAY",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.primaryColor,
                    fontSize: 22),
              ),
              Text(
                "Completed",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.greenColor,
                    fontSize: 18),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                width: 90.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.tasksList.where((element) => element.isDone).toList().length}/",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.greenColor,
                          fontSize: 20),
                    ),
                    Text(
                      tasks.length.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.redColor,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
