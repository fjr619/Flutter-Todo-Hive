import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_hive/presentation/screens/task/task_screen.dart';

import '../../../utils/colors.dart';

class FAB extends StatelessWidget {
  const FAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      elevation: 20,
      onPressed: () {
        //TODO pakai go router
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => TaskScreen(),
          ),
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
