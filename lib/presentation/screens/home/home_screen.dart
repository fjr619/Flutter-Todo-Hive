import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_todo_hive/presentation/screens/home/components/home_app_bar.dart';
import 'package:flutter_todo_hive/presentation/screens/home/components/home_content.dart';
import 'package:flutter_todo_hive/presentation/screens/home/components/home_drawer.dart';

import 'components/fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<int> test = [2, 323, 23];

  GlobalKey<SliderDrawerState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: const FAB(),
      body: SliderDrawer(
        key: drawerKey,
        isDraggable: false,
        animationDuration: 500,

        ///Drawer
        slider: HomeDrawer(),

        /// Custom appbar
        appBar: HomeAppBar(
          drawerKey: drawerKey,
          deleteAllClick: () {
            log("delete all tasks");
          },
        ),

        ///Home Content
        child: HomeContent(
          datas: test,
          onSwipeDismiss: (data) {
            log("remove data $data");
            setState(
              () {
                test.remove(data);
              },
            );
          },
        ),
      ),
    );
  }
}
