import 'package:get/get.dart';

class TrackingGrowthController extends GetxController {
  //TODO: Implement TrackingGrowthController

  final count = 0.obs;
     var selectedContainer = 0.obs; 
  //      var selectedAge = '0-6 bulan'.obs; // Inisialisasi dengan umur default
  // var selectedGender = 'Laki-laki'.obs;
  //   final selectedAge = 0.obs;
  // final selectedGender = 'Laki-laki'.obs;

    final selectedAgeRange = '0-2'.obs; // Default to 0-2 years
  final selectedGender = 'Laki-laki'.obs;
   // Inisialisasi dengan jenis kelamin default


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
  // Fungsi untuk mengubah umur yang dipilih
  // void changeSelectedAge(String age) {
  //   selectedAge.value = age;
  // }

  // Fungsi untuk mengubah jenis kelamin yang dipilih
  void changeSelectedGender(String gender) {
    selectedGender.value = gender;
  }
// Menyimpan status container yang dipilih

  // Fungsi untuk memilih container
  void selectContainer(int index) {
    selectedContainer.value = index; // Ubah status container yang dipilih
  }
    // Daftar pilihan umur dan jenis kelamin
  final List<String> ageOptions = [
    '0-6 bulan',
    '6-12 bulan',
    '1-2 tahun',
    '2-5 tahun',
    '5-10 tahun',
  ];

  final List<String> genderOptions = [
    'Laki-laki',
    'Perempuan',
  ];
}
