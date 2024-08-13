import 'package:flutter/material.dart';
import 'package:flutter_todo_hive/presentation/utils/strings.dart';
import 'package:ftoast/ftoast.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

/// Empty Title & Subtite TextFields Warning
emptyFieldsWarning(context) {
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: "You must fill all Fields!",
    corner: 20.0,
    duration: 2000,
    padding: const EdgeInsets.all(20),
  );
}

/// Nothing Enter When user try to edit the current tesk
nothingEnterOnUpdateTaskMode(context) {
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: "You must edit the tasks then try to update it!",
    corner: 20.0,
    duration: 3000,
    padding: const EdgeInsets.all(20),
  );
}

/// No task Warning Dialog
dynamic warningNoTask(
    {required BuildContext context, required Function() onDismiss}) {
  return PanaraInfoDialog.showAnimatedGrow(context,
      title: AppStr.oopsMsg,
      message:
          "There is no Task For Delete!\n Try adding some and then try to delete it!",
      buttonText: "Okay",
      onTapDismiss: onDismiss,
      // onTapDismiss: () {
      //   Navigator.pop(context);
      // },
      panaraDialogType: PanaraDialogType.warning,
      noImage: true);
}

/// Delete All Task Dialog
dynamic deleteAllTask(
    {required BuildContext context,
    required Function() onCancel,
    required Function() onConfirm}) {
  return PanaraConfirmDialog.showAnimatedFade(context,
      title: AppStr.areYouSure,
      message:
          "Do You really want to delete all tasks? You will no be able to undo this action!",
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      // onTapCancel: () {
      //   Navigator.pop(context);
      // },
      // onTapConfirm: () {
      //   BaseWidget.of(context).dataStore.box.clear();
      //   Navigator.pop(context);
      // },
      onTapCancel: onCancel,
      onTapConfirm: onConfirm,
      panaraDialogType: PanaraDialogType.error,
      barrierDismissible: false,
      noImage: true);
}
