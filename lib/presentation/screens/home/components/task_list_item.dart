import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_hive/domain/model/task.dart';
import 'package:flutter_todo_hive/presentation/screens/task/task_screen.dart';
import 'package:flutter_todo_hive/presentation/utils/colors.dart';
import 'package:intl/intl.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: task.isCompleted
            ? const Color.fromARGB(154, 119, 144, 229)
            : AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      duration: const Duration(milliseconds: 300),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            /// Navigate to Task View to see Task Details
            log("Navigate to Task View");
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => TaskScreen(
                  task: task,
                ),
              ),
            );
          },
          child: ListTile(
            /// Check Icon
            leading: Transform.scale(
              scale: 1.3,
              child: Checkbox(
                shape: const CircleBorder(),
                side: WidgetStateBorderSide.resolveWith(
                  (states) => BorderSide(
                      width: 1.0,
                      color: task.isCompleted
                          ? AppColors.primaryColor
                          : const Color.fromARGB(255, 164, 164, 164)),
                ),
                checkColor: Colors.white,
                activeColor: AppColors.primaryColor,
                value: task.isCompleted,
                onChanged: (value) {
                  ///check and uncheck
                  log("onChange $value");
                  // task.isCompleted = value ?? false;
                },
              ),
            ),

            /// Task Title
            title: Text(
              task.title,
              style: TextStyle(
                color: task.isCompleted ? AppColors.primaryColor : Colors.black,
                fontWeight: FontWeight.w500,
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),

            ///Task Description
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.subTitle,
                  style: TextStyle(
                    color: task.isCompleted
                        ? AppColors.primaryColor
                        : const Color.fromARGB(255, 164, 164, 164),
                    fontWeight: FontWeight.w300,
                    decoration:
                        task.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),

                ///Date of task
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat('hh:mm a').format(task.createdAtTime),
                          style: TextStyle(
                            fontSize: 14,
                            color: task.isCompleted
                                ? Colors.white
                                : const Color.fromARGB(255, 164, 164, 164),
                          ),
                        ),
                        Text(
                          DateFormat.yMMMEd().format(task.createdAtDate),
                          style: TextStyle(
                            fontSize: 12,
                            color: task.isCompleted
                                ? Colors.white
                                : const Color.fromARGB(255, 164, 164, 164),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
