import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_todo_hive/presentation/utils/colors.dart';
import 'package:flutter_todo_hive/presentation/utils/strings.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        flexibleSpace: Container(
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
              )
            ],
          ),
        ),
      ),
      floatingActionButton: const FAB(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            // /// Custom App bar
            // Container(
            //   // margin: MediaQuery.of(context).padding,
            //   padding: MediaQuery.of(context).padding,
            //   width: double.infinity,
            //   color: Colors.red,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       ///Progress Indicator
            //       const SizedBox(
            //         width: 30,
            //         height: 30,
            //         child: CircularProgressIndicator(
            //           value: 1 / 3,
            //           backgroundColor: Colors.grey,
            //           valueColor: AlwaysStoppedAnimation(
            //             AppColors.primaryColor,
            //           ),
            //         ),
            //       ),
            //       const Gap(25),

            //       /// Top Level Task Info
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             AppStr.mainTitle,
            //             style: textTheme.displayMedium,
            //           ),
            //           const Gap(3),
            //           Text(
            //             "1 of 3 tasks",
            //             style: textTheme.titleMedium,
            //           )
            //         ],
            //       )
            //     ],
            //   ),
            // ),

            /// Divider
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Divider(
                thickness: 2,
                indent: 100,
              ),
            ),

            /// Tasks
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
