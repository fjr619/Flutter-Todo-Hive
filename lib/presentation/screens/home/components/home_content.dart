import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_hive/domain/model/task.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/strings.dart';
import 'task_list_item.dart';

class HomeContent extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task task) onSwipeDismiss;
  final Function(Task task) onUpdateTaskCompleted;

  const HomeContent(
      {required this.tasks,
      required this.onSwipeDismiss,
      super.key,
      required this.onUpdateTaskCompleted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          /// Divider
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Divider(
              thickness: 2,
              indent: 100,
            ),
          ),

          /// Tasks lIst
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: tasks.isNotEmpty ? _listNotEmpty() : _listEmpty(),
            ),
          ),
        ],
      ),
    );
  }

  /// Task list is empty
  Widget _listEmpty() {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeIn(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Lottie.asset('assets/lottie/1.json',
                  animate: tasks.isNotEmpty ? false : true),
            ),
          ),
          FadeInUp(from: 30, child: const Text(AppStr.doneAllTask))
        ],
      ),
    );
  }

  /// Task list is not empty
  Widget _listNotEmpty() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: tasks.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          background: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delete_outline,
                color: Colors.grey,
              ),
              Gap(8),
              Text(
                AppStr.deleteTask,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          onDismissed: (direction) {
            onSwipeDismiss(tasks[index]);
          },
          key: Key(tasks[index].id),
          child: TaskListItem(
            task: tasks[index],
            onUpdateCheckbox: (newValue) {
              var task = tasks[index];
              task.isCompleted = newValue;
              onUpdateTaskCompleted(task);
            },
          ),
        );
      },
    );
  }
}
