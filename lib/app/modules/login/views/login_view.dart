import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../src/components/buttons/custom_button.dart';
import '../../../../src/components/buttons/logo/animation_logo.dart';
import '../../../../src/components/buttons/text_form_field/text_form_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView(this.isLogin, {Key? key}) : super(key: key);
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AnimationLogo(),
              Column(
                children: [
                  CustomTextField(
                    controller: controller.emailCtl,
                    hintText: 'Enter your email',
                    labelText: "Email",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    controller: controller.passwordCtl,
                    hintText: 'Enter your password',
                    labelText: "Password",
                  ),
                ],
              ),
              CustomButton(
                onPressed: () async => await controller.loginRegister(isLogin),
                text: isLogin == null ? "Login" : "Register",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
