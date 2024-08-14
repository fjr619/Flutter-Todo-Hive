import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_todo_hive/di/di.dart';
import 'package:flutter_todo_hive/domain/model/task.dart';
import 'package:flutter_todo_hive/domain/repository/task_repository.dart';
import 'package:flutter_todo_hive/presentation/screens/home/components/home_app_bar.dart';
import 'package:flutter_todo_hive/presentation/screens/home/components/home_content.dart';
import 'package:flutter_todo_hive/presentation/screens/home/components/home_drawer.dart';
import 'package:flutter_todo_hive/presentation/utils/util.dart';

import 'components/fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<SliderDrawerState> drawerKey = GlobalKey();

  final TaskRepository taskRepository = getIt<TaskRepository>();

  /// Checking Done Tasks
  int checkDoneTask(List<Task> task) {
    int i = 0;
    for (Task doneTasks in task) {
      if (doneTasks.isCompleted) {
        i++;
      }
    }
    return i;
  }

  /// Checking The Value Of the Circle Indicator
  int valueOfTheIndicator(List<Task> tasks) {
    if (tasks.isNotEmpty) {
      return tasks.length;
    } else {
      return 0;
    }
  }

  /// Delete All Task
  void deleteAllTasks(List<Task> tasks) {
    tasks.isEmpty
        ? warningNoTask(
            context: context,
            onDismiss: () {
              Navigator.of(context).pop();
            },
          )
        : deleteAllTask(
            context: context,
            onCancel: () {
              Navigator.of(context).pop();
            },
            onConfirm: () {
              taskRepository.deleteAllTask();
              Navigator.of(context).pop();
            },
          );
  }

  /// Delete Selected Task
  void deleteTask(Task task) {
    taskRepository.deleteTask(task).catchError((error) {
      generalToast(context, error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: taskRepository.getTasksNotifier(),
      builder: (context, value, child) {
        var tasks = value;
        log("tasks ${tasks.length}");

        /// Sort Task List
        tasks.sort(((a, b) => a.createdAtDate.compareTo(b.createdAtDate)));
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: const FAB(),
          body: SliderDrawer(
            key: drawerKey,
            isDraggable: false,
            animationDuration: 500,

            ///Drawer
            slider: HomeDrawer(),

            /// Custom appbar
            appBar: HomeAppBar(
              taskSize: valueOfTheIndicator(tasks),
              taskDoneSize: checkDoneTask(tasks),
              drawerKey: drawerKey,
              deleteAllClick: () {
                deleteAllTasks(tasks);
              },
            ),

            ///Home Content
            child: HomeContent(
              tasks: tasks,
              onUpdateTaskCompleted: (task) {
                taskRepository.updateTask(task);
              },
              onSwipeDismiss: (task) {
                deleteTask(task);
              },
            ),
          ),
        );
      },
    );
  }
}
