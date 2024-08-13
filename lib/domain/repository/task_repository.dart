import 'package:flutter/foundation.dart';
import 'package:flutter_todo_hive/domain/model/task.dart';
import 'package:hive/hive.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<Task?> getTask(String id);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(Task task);
  ValueListenable<Box> listenToTask();
}
