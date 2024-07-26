import 'dart:developer';

import 'package:flutter/material.dart';

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
        //navigate to task view
        log("task view");
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
