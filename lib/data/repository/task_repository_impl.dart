import 'package:flutter/foundation.dart';
import 'package:flutter_todo_hive/data/local/entities/task_entity.dart';
import 'package:flutter_todo_hive/data/local/hive_data_store.dart';
import 'package:flutter_todo_hive/data/mapper/task_mapper.dart';
import 'package:flutter_todo_hive/domain/model/task.dart';
import 'package:flutter_todo_hive/domain/repository/task_repository.dart';
import 'package:hive_flutter/adapters.dart';

class TaskRepositoryImpl implements TaskRepository {
  final HiveDataStore _hiveDataStore;
  final Box<TaskEntity> _taskEntityBox;
  late ValueListenable<Box<TaskEntity>> _taskListenable;
  final ValueNotifier<List<Task>> tasksNotifier = ValueNotifier([]);

  TaskRepositoryImpl(this._hiveDataStore, this._taskEntityBox) {
    _taskListenable = _taskEntityBox.listenable();
    _taskListenable.addListener(_onTasksChanged);
    _loadInitialTasks();
  }

  @override
  Future<void> addTask(Task task) async {
    TaskEntity taskEntity = TaskEntity.create(
        title: task.title,
        subTitle: task.subTitle,
        createdAtDate: task.createdAtDate,
        createdAtTime: task.createdAtTime);
    await _hiveDataStore.addTask(task: taskEntity);
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

  void _onTasksChanged() {
    tasksNotifier.value =
        _taskListenable.value.values.map((task) => task.toDomain()).toList();
  }

  Future<void> _loadInitialTasks() async {
    final tasks = await _hiveDataStore
        .getAllTasks()
        .then((onValue) => onValue.map((task) => task.toDomain()).toList());
    tasksNotifier.value = tasks;
  }

  @override
  ValueNotifier<List<Task>> getTasksNotifier() {
    return tasksNotifier;
  }

  @override
  Future<void> deleteAllTask() async {
    await _taskEntityBox.clear();
  }
}
