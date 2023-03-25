import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../src/components/buttons/message/send_message.dart';
import '../../../../src/components/buttons/message/stream_message.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚡️Chat'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () async => await controller.logout(),
                child: const Text('Logout Account'),
              ),
              PopupMenuItem(
                onTap: () async => await controller.delete(),
                child: const Text('Delete Account'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          const StreamMessage(),
          SendMEssage(
            controller.textCrl,
            onPressed: () async => controller.sendMessage(),
          ),
        ],
      ),
    );
  }
}
