import 'package:get/get.dart';

import '../../app/modules/flashChat/bindings/flash_chat_binding.dart';
import '../../app/modules/flashChat/views/flash_chat_view.dart';
import '../../app/modules/login/bindings/login_binding.dart';
import '../../app/modules/login/views/login_view.dart';
import '../../app/modules/product/bindings/product_binding.dart';
import '../../app/modules/product/views/product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const FLASH_CHAT = Routes.FLASH_CHAT;
  static const PRODUCT = Routes.PRODUCT;

  // Home = Product

  static final routes = [
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.FLASH_CHAT,
      page: () => const FlashChatView(),
      binding: FlashChatBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(Get.arguments as bool),
      binding: LoginBinding(),
    ),
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    // ),
  ];
}
