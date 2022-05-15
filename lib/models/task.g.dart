// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      id: fields[0] as String,
      createdAt: fields[1] as DateTime,
      taskTitle: fields[2] as String,
      taskCategory: fields[3] as String,
      isFavorite: fields[4] as bool,
      taskDesc: fields[5] as String,
      taskColor: fields[6] as String,
      taskFinalDate: fields[7] as DateTime,
      isDone: fields[8] as bool,
      isLater: fields[9] as bool,
      notification: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.taskTitle)
      ..writeByte(3)
      ..write(obj.taskCategory)
      ..writeByte(4)
      ..write(obj.isFavorite)
      ..writeByte(5)
      ..write(obj.taskDesc)
      ..writeByte(6)
      ..write(obj.taskColor)
      ..writeByte(7)
      ..write(obj.taskFinalDate)
      ..writeByte(8)
      ..write(obj.isDone)
      ..writeByte(9)
      ..write(obj.isLater)
      ..writeByte(10)
      ..write(obj.notification);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TaskAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
