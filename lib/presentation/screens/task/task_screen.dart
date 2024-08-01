import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:flutter_todo_hive/presentation/screens/task/components/date_time_selection.dart';
import 'package:flutter_todo_hive/presentation/utils/colors.dart';
import 'package:flutter_todo_hive/presentation/utils/strings.dart';
import 'package:intl/intl.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController titleTaskController = TextEditingController();
  final TextEditingController descriptionTaskController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: Expanded(
          child: Column(
            children: [
              _titleSection(textTheme),
              _textfieldSection(textTheme, context),
              _allButtonSection()
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleSection(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
              text: TextSpan(
                text: AppStr.addNewTask,
                style: textTheme.titleLarge,
                children: const [
                  TextSpan(
                      text: AppStr.taskStrnig,
                      style: TextStyle(fontWeight: FontWeight.w700))
                ],
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _textfieldSection(TextTheme textTheme, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title of textfield
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              AppStr.titleOfTitleTextField,
              style: textTheme.headlineMedium?.copyWith(fontSize: 12),
            ),
          ),

          ///Title textfield
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: ListTile(
              title: TextFormField(
                controller: titleTaskController,
                cursorHeight: 60,
                maxLines: 6,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                onFieldSubmitted: (value) {},
                onChanged: (value) {},
              ),
            ),
          ),

          ///Note TextField
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: TextFormField(
                controller: descriptionTaskController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  hintText: AppStr.addNote,
                ),
                onFieldSubmitted: (value) {},
                onChanged: (value) {},
              ),
            ),
          ),

          ///Time picker
          DateTimeSelection(
            title: AppStr.timeString,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              showModalBottomSheet(
                context: context,
                builder: (context) => SizedBox(
                  height: 255,
                  child: TimePickerWidget(
                    // initDateTime: ,
                    dateFormat: 'HH:mm',
                    onConfirm: (dateTime, selectedIndex) {
                      log(DateFormat.Hm().format(dateTime));
                    },
                  ),
                ),
              );
            },
          ),

          ///Date picker
          DateTimeSelection(
            title: AppStr.dateString,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              DatePicker.showDatePicker(
                context,
                onConfirm: (dateTime, selectedIndex) {
                  log(DateFormat('dd-mm-yyyy').format(dateTime));
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _allButtonSection() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// Delete Task Button
            Container(
              constraints: const BoxConstraints(
                minWidth: 150,
              ),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    side: const BorderSide(
                        width: 1, color: AppColors.primaryColor)),
                icon: const Icon(
                  Icons.close,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  log('on delete');
                },
                label: const Text(
                  AppStr.deleteTask,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),

            ///Add or update task
            Container(
              constraints: const BoxConstraints(
                minWidth: 150,
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: const Text(AppStr.addNewTask)),
            ),
          ],
        ),
      ),
    );
  }
}
