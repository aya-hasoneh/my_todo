import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  Task(
      {required this.id,
      required this.createdAt,
      required this.taskTitle,
      required this.taskCategory,
      required this.isFavorite,
      required this.taskDesc,
      required this.taskColor,
      required this.taskFinalDate,
      required this.isDone,
      required this.isLater,
      required this.notification});

  factory Task.create({required String taskTitle, DateTime? createdAt, required String taskCategory, required String taskDesc, required String taskColor, required DateTime taskFinalDate, required String notification}) => Task(
      id: const Uuid().v1(),
      createdAt: createdAt ?? DateTime.now(),
      taskTitle: taskTitle,
      taskCategory: taskCategory,
      isFavorite: false,
      taskDesc: taskDesc,
      taskColor: taskColor,
      taskFinalDate: taskFinalDate,
      isDone: false,
      isLater: false,
      notification: notification);

  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime createdAt;

  @HiveField(2)
  late String taskTitle;

  @HiveField(3)
  late String taskCategory;

  @HiveField(4)
  bool isFavorite;

  @HiveField(5)
  late String taskDesc;

  @HiveField(6)
  late String taskColor;

  @HiveField(7)
  late DateTime taskFinalDate;

  @HiveField(8)
  bool isDone;

  @HiveField(9)
  bool isLater;

  @HiveField(10)
  late String notification;
}
