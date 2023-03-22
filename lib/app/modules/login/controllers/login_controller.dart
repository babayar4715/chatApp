import 'dart:math';

import 'package:chat_app/app/modules/login/service/login_service.dart';
import 'package:chat_app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailCtl = TextEditingController();
  final passwordCtl = TextEditingController();

  final count = 0.obs;

  Future<void> loginRegister() async {
    final user = LoginService.register(
      emailCtl.text,
      passwordCtl.text,
    );
    if (user != null) {
      Get.offAllNamed(Routes.PRODUCT);
    } else {
      log('user is null' as num);
    }
  }
}
