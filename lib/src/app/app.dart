import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp(
    this.isAuth, {
    super.key,
  });

  final bool isAuth;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: isAuth ? AppPages.PRODUCT : AppPages.FLASH_CHAT,
      getPages: AppPages.routes,
    );
  }
}
