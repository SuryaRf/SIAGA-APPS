import 'package:get/get.dart';

class ProfileController extends GetxController {


    var motherName = 'Siti Aisyah'.obs;
  var email = 'sitiaisyah@gmail.com'.obs;
  var phoneNumber = '+62 812 3456 7890'.obs;
  //TODO: Implement ProfileController

  final count = 0.obs;
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
  void logOut() {
    // Implement your log out logic
  }
}
