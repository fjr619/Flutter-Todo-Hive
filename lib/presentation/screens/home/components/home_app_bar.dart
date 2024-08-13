import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:gap/gap.dart';

import '../../../utils/colors.dart';
import '../../../utils/strings.dart';

class HomeAppBar extends StatefulWidget {
  final GlobalKey<SliderDrawerState> drawerKey;
  final Function deleteAllClick;
  final int taskSize;
  final int taskDoneSize;

  const HomeAppBar(
      {super.key,
      required this.drawerKey,
      required this.deleteAllClick,
      required this.taskSize,
      required this.taskDoneSize});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isDrawerOpen = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onDrawerToggle() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      if (isDrawerOpen) {
        animationController.forward();
        widget.drawerKey.currentState?.openSlider();
      } else {
        animationController.reverse();
        widget.drawerKey.currentState?.closeSlider();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent),
      child: Container(
        padding: MediaQuery.of(context).padding,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    onPressed: () {
                      onDrawerToggle();
                    },
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: animationController,
                      size: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    onPressed: () {
                      //TODO: WE WILL REMOVE ALL THE TASK FROM DB
                      widget.deleteAllClick();
                    },
                    icon: const Icon(
                      CupertinoIcons.trash,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Progress Indicator
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: (widget.taskDoneSize).toDouble() /
                        (widget.taskSize).toDouble(),
                    backgroundColor: Colors.grey,
                    valueColor: const AlwaysStoppedAnimation(
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
                      "${widget.taskDoneSize} of ${widget.taskSize} tasks",
                      style: textTheme.titleMedium,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
