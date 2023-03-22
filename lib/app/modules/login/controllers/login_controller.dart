import 'dart:math';

import 'package:chat_app/app/modules/login/service/login_service.dart';
import 'package:chat_app/src/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/utils/alert/alert.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailCtl = TextEditingController();
  final passwordCtl = TextEditingController();

  final count = 0.obs;

  Future<void> loginRegister(bool isLogin) async {
    if (formKey.currentState!.validate() &&
        GetUtils.isEmail(emailCtl.text) &&
        GetUtils.isPassport(passwordCtl.text)) {
      AppDialog.showLoading();
      final user = isLogin
          ? LoginService.login(emailCtl.text, passwordCtl.text)
          : LoginService.register(emailCtl.text, passwordCtl.text);
      Get.back();

      if (user != null) {
        await Get.offAllNamed(Routes.PRODUCT);
      } else {
        await AppDialog.showAlert(
          isLogin
              ? 'Login je Passwordto kata bar'
              : " kata boldy kayradan registrasia jasanyz ",
          'error',
        );
      }
    } else {
      print('error');
    }
  }
}
