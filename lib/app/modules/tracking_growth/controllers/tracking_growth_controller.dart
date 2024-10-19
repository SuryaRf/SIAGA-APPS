import 'package:get/get.dart';

class TrackingGrowthController extends GetxController {
  //TODO: Implement TrackingGrowthController

  final count = 0.obs;
     var selectedContainer = 0.obs; 
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

// Menyimpan status container yang dipilih

  // Fungsi untuk memilih container
  void selectContainer(int index) {
    selectedContainer.value = index; // Ubah status container yang dipilih
  }
}
