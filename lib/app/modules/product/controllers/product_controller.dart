import 'dart:developer';

import 'package:chat_app/src/utils/alert/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/routes/app_pages.dart';
import '../service/home_service.dart';

class ProductController extends GetxController {
  final count = 0.obs;
  final textCrl = TextEditingController();

  Future<void> logout() async {
    AppDialog.showLoading();
    await HomeService.logOut();
    await Get.offAllNamed(Routes.FLASH_CHAT);
  }

  Future<void> delete() async {
    AppDialog.showLoading();

    await HomeService.delete();
    await Get.offAllNamed(Routes.FLASH_CHAT);
  }

  Future<void> sendMessage() async {
    final sms = textCrl.text.trim();
    textCrl.clear();

    if (sms != '') {
      await HomeService.sendMessage(sms);
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamMessage() {
    return HomeService.streamMessage();
  }
}
