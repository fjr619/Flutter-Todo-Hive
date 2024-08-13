import 'package:flutter_todo_hive/data/local/entities/task_entity.dart';
import 'package:flutter_todo_hive/data/local/hive_data_store.dart';
import 'package:flutter_todo_hive/data/repository/task_repository_impl.dart';
import 'package:flutter_todo_hive/domain/repository/task_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

final getIt = GetIt.instance;
Future<void> configureDepedencies() async {
  // Inisialisasi Hive
  await Hive.initFlutter();
  Hive.registerAdapter(TaskEntityAdapter());
  Box<TaskEntity> taskBox = await Hive.openBox<TaskEntity>('taskBox');

  // Registrasi dependency
  getIt.registerSingleton<HiveDataStore>(HiveDataStore(box: taskBox));
  getIt.registerSingleton<TaskRepository>(
      TaskRepositoryImpl(getIt<HiveDataStore>()));
}
