import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_hive/presentation/screens/home/components/task_list_item.dart';
import 'package:flutter_todo_hive/presentation/utils/strings.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import 'components/appbar.dart';
import 'components/fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<int> test = [2, 323, 23];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,

      /// Custom App Bar
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        flexibleSpace: CustomAppBar(textTheme: textTheme),
      ),
      floatingActionButton: const FAB(),
      body: SizedBox(
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
                child: test.isNotEmpty

                    /// Task list is not empty
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: test.length,
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
                                )
                              ],
                            ),
                            onDismissed: (direction) {
                              /// we will remove current task from DB
                              setState(() {
                                test.remove(test[index]);
                              });
                            },
                            // key: Key(index.toString()),
                            key: UniqueKey(),
                            child: TaskListItem(
                              data: test[index],
                            ),
                          );
                        },
                      )

                    /// Task list is empty
                    : SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FadeIn(
                              child: SizedBox(
                                width: 200,
                                height: 200,
                                child: Lottie.asset('assets/lottie/1.json',
                                    animate: test.isNotEmpty ? false : true),
                              ),
                            ),
                            FadeInUp(
                                from: 30, child: const Text(AppStr.doneAllTask))
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

