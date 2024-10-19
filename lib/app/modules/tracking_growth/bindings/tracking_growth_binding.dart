import 'package:get/get.dart';

import '../controllers/tracking_growth_controller.dart';

class TrackingGrowthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackingGrowthController>(
      () => TrackingGrowthController(),
    );
  }
}
