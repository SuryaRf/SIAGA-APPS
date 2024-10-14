import 'package:get/get.dart';

import '../controllers/comunitty_controller.dart';

class ComunittyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComunittyController>(
      () => ComunittyController(),
    );
  }
}
