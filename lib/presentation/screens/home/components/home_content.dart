import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_hive/domain/model/task.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/strings.dart';
import 'task_list_item.dart';

class HomeContent extends StatelessWidget {
  final List<int> datas;
  final Function(int data) onSwipeDismiss;

  const HomeContent(
      {required this.datas, required this.onSwipeDismiss, super.key});

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
              child: datas.isNotEmpty ? _listNotEmpty() : _listEmpty(),
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
                  animate: datas.isNotEmpty ? false : true),
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
      itemCount: datas.length,
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
            onSwipeDismiss(datas[index]);
          },
          key: UniqueKey(),
          child: TaskListItem(
            task: Task(
                id: "2",
                title: "Home Task",
                subTitle: "Cleaning the room",
                createdAtTime: DateTime.now(),
                createdAtDate: DateTime.now(),
                isCompleted: false),
          ),
        );
      },
    );
  }
}
