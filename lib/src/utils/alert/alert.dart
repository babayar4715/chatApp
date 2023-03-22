import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppDialog {
  static void showLoading() {
    Get.defaultDialog(content: const CupertinoActivityIndicator());
  }

  static Future<void> showAlert(String content, String? title) async {
    await Get.defaultDialog(
      title: title ?? 'Alert',
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
    );
  }
}
