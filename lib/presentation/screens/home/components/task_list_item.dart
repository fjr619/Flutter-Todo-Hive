import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_todo_hive/presentation/utils/colors.dart';

class TaskListItem extends StatelessWidget {
  final int data;

  const TaskListItem({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 10),
        ],
      ),
      duration: const Duration(milliseconds: 300),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          /// Navigate to Task View to see Task Details
          log("onclick item $data");
        },
        child: ListTile(
          /// Check Icon
          leading: Transform.scale(
            scale: 1.3,
            child: Checkbox(
              shape: const CircleBorder(),
              value: true,
              onChanged: (value) {
                ///check and uncheck
                log("onChange $value index $data");
              },
            ),
          ),

          /// Task Title
          title: Text(
            "Done text $data",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.lineThrough,
            ),
          ),

          ///Task Description
          subtitle: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),

              ///Date of task
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        "Subdate",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
