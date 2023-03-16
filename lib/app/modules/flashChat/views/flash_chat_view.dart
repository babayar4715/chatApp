import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/src/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../src/components/buttons/custom_button.dart';
import '../../../../src/components/buttons/logo/animation_logo.dart';
import '../../../../src/constants/app_text_styles.dart';
import '../../../../src/routes/app_pages.dart';
import '../controllers/flash_chat_controller.dart';

class FlashChatView extends GetView<FlashChatController> {
  const FlashChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AnimationLogo(
                size: 120,
              ),
              DefaultTextStyle(
                style: AppTextStyles.flashChatstyle,
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText("Flash Chat"),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            backgroundColor: AppColours.logibtn,
            onPressed: () async => Get.toNamed(Routes.LOGIN, arguments: true),
            text: "Login",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomButton(
            backgroundColor: AppColours.registerBtn,
            onPressed: () async => Get.toNamed(Routes.LOGIN, arguments: false),
            text: "Register",
          ),
        ],
      ),
    );
  }
}
