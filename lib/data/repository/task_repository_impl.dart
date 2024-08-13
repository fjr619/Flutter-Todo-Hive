import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter_todo_hive/data/local/hive_data_store.dart';
import 'package:flutter_todo_hive/data/mapper/task_mapper.dart';
import 'package:flutter_todo_hive/domain/model/task.dart';
import 'package:flutter_todo_hive/domain/repository/task_repository.dart';
import 'package:hive/hive.dart';

class TaskRepositoryImpl implements TaskRepository {
  final HiveDataStore _hiveDataStore;

  TaskRepositoryImpl(this._hiveDataStore);

  @override
  Future<void> addTask(Task task) async {
    await _hiveDataStore.addTask(task: task.toEntity());
  }

  @override
  Future<void> deleteTask(Task task) async {
    await _hiveDataStore.deleteTask(task: task.toEntity());
  }

  @override
  Future<Task?> getTask(String id) async {
    var task = await _hiveDataStore.getTask(id: id);
    return task?.toDomain();
  }

  @override
  Future<void> updateTask(Task task) async {
    await _hiveDataStore.updateTask(task: task.toEntity());
  }

  @override
  ValueListenable<Box> listenToTask() {
    return _hiveDataStore.listenToTask();
  }
}
