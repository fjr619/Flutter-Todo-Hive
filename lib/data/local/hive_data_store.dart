import 'package:flutter/foundation.dart';
import 'package:flutter_todo_hive/data/local/entities/task_entity.dart';
import 'package:hive_flutter/adapters.dart';

/// All the [CRUD] operation method for Hive DB
class HiveDataStore {
  /// Our current Box with all the saved data inside - Box<TaskEntity>
  final Box<TaskEntity> box;

  HiveDataStore({required this.box});

  /// Add new task to box
  Future<void> addTask({required TaskEntity task}) async {
    await box.put(task.id, task);
  }

  /// Show Task
  Future<TaskEntity?> getTask({required String id}) async {
    return box.get(id);
  }

  /// Update Task
  Future<void> updateTask({required TaskEntity task}) async {
    await box.put(task.id, task);
  }

  /// Delete Task
  Future<void> deleteTask({required TaskEntity task}) async {
    await box.delete(task.id);
  }

  Future<List<TaskEntity>> getAllTasks() async {
    return box.values.toList();
  }

  /// Listen to Box Changes
  /// using this method we will listen to box changes and updates the UI accordingly
  ValueListenable<Box<TaskEntity>> listenToTask() {
    return box.listenable();
  }

  Future<void> deleteAllTask() async {
    await box.clear();
  }
}
