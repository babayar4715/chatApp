import 'package:get/get.dart';

import '../controllers/flash_chat_controller.dart';

class FlashChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlashChatController>(
      () => FlashChatController(),
    );
  }
}
