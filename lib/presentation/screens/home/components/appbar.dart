import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/colors.dart';
import '../../../utils/strings.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: MediaQuery.of(context).padding,
      padding: MediaQuery.of(context).padding,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///Progress Indicator
          const SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              value: 1 / 3,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(
                AppColors.primaryColor,
              ),
            ),
          ),
          const Gap(25),

          /// Top Level Task Info
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStr.mainTitle,
                style: textTheme.displayMedium,
              ),
              const Gap(3),
              Text(
                "1 of 3 tasks",
                style: textTheme.titleMedium,
              )
            ],
          ),
        ],
      ),
    );
  }
}
