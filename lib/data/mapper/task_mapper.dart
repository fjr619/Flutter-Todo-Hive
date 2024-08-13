import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_todo_hive/data/local/entities/task_entity.dart';
import 'package:flutter_todo_hive/domain/model/task.dart';
import 'package:hive/hive.dart';

extension TaskEntityMapper on TaskEntity {
  Task toDomain() {
    return Task(
        id: id,
        title: title,
        subTitle: title,
        createdAtTime: createdAtTime,
        createdAtDate: createdAtDate,
        isCompleted: isCompleted);
  }
}

extension TaskMapper on Task {
  TaskEntity toEntity() => TaskEntity(
      id: id,
      title: title,
      subTitle: title,
      createdAtTime: createdAtTime,
      createdAtDate: createdAtDate,
      isCompleted: isCompleted);
}
