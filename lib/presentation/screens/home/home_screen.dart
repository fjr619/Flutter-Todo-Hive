import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_todo_hive/presentation/screens/home/components/home_content.dart';

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
        body: HomeContent(
          datas: test,
          onSwipeDismiss: (data) {
            log("remove data $data");
            setState(
              () {
                test.remove(data);
              },
            );
          },
        ));
  }
}