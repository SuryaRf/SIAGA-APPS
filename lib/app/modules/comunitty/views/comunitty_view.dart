import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/comunitty_controller.dart';

class ComunittyView extends GetView<ComunittyController> {
  const ComunittyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ComunittyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ComunittyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
