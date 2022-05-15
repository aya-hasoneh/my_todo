import 'package:flutter/material.dart';

import '/main.dart';
import '/utils/colors.dart';
import '/utils/colors_parser.dart';
import '/view/tasks_screens/tasks_bloc.dart';
import '/widgets/shared_widgets/search_text_field.dart';
import '/widgets/shared_widgets/text_fields/custom_tasks_text_field_widget.dart';
import '/widgets/shared_widgets/custom_circle_avatar/build_priority_check_colors.dart';

class NewTaskScreen extends StatefulWidget {
  static const screenRoute = 'newTaskScreen';

  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final TasksBloc _bloc = TasksBloc();

  @override
  void initState() {
    super.initState();

    // useless ??!
    _bloc.taskTitleController.text;
    _bloc.taskDescriptionController.text;
    _bloc.taskCategoryController.text;
    _bloc.taskNotificationController.text;
  }

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
          toolbarHeight: 60,
          title: const Text(
            "New Task",
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              color: ThemeColors.primaryColor,
              child: const CustomSearchWidget(),
            ),
            CustomTasksTextFieldWidget(
              text: "Task Name",
              controller: _bloc.taskTitleController,
            ),
            CustomTasksTextFieldWidget(
                text: "Description",
                controller: _bloc.taskDescriptionController),
            CustomTasksTextFieldWidget(
                text: "Category", controller: _bloc.taskCategoryController),
            Container(
              width: double.infinity,
              height: 60,
              color: ThemeColors.whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  _bloc.selectDate(context, setState);
                },
                child: Text(
                  "${_bloc.selectedDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(
                    color: ThemeColors.lightGreyColor,
                  ),
                ),
              ),
            ),
            Divider(
              height: 0,
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Priority",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              height: 60,
              color: ThemeColors.whiteColor,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ColorParser.colorList.length,
                itemBuilder: (ctx, i) => BuildPriorityCheckColors(
                  isSelected: _bloc.selectedColor == ColorParser.colorList[i],
                  onTap: () {
                    setState(
                      () => _bloc.selectedColor = ColorParser.colorList[i],
                    );
                  },
                  color: ColorParser.colorList[i],
                ),
              ),
            ),
            Divider(height: 0, color: Colors.grey.shade300, thickness: 1),
            CustomTasksTextFieldWidget(
                text: "Notification",
                controller: _bloc.taskNotificationController),
            const Spacer(),
            ElevatedButton(
              onPressed: () => _bloc.addNewTask(base, context),
              child: const Text(
                "ADD",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
