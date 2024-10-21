import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:siaga/app/data/const/font.dart';
import 'package:siaga/app/data/model/line_chart1.dart';
import '../../../data/model/line_chart2.dart';
import '../../../data/model/line_chart3.dart';
import '../../../data/model/line_chart4.dart';
import '../controllers/tracking_growth_controller.dart';
import 'table.dart';

class TrackingGrowthView extends GetView<TrackingGrowthController> {
  const TrackingGrowthView({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller
    Get.put(TrackingGrowthController()); // Letakkan ini di sini

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pantau Pertumbuhan'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => controller.selectContainer(0),
                        child: Obx(
                          () => Container(
                            width: width * 0.3,
                            height: height * 0.04,
                            decoration: BoxDecoration(
                              color: controller.selectedContainer.value == 0
                                  ? Colors.pinkAccent
                                  : Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 0.3,
                                  offset: Offset(1, 2),
                                )
                              ], // Warna ditempatkan di dalam BoxDecoration
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ), // Menambahkan border radius
                            ),
                            child: Center(
                              child: Text(
                                'Tracking',
                                style: medium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        controller.selectedContainer.value == 0
                                            ? Colors.white
                                            : Color.fromARGB(255, 87, 87, 87)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.selectContainer(1),
                        child: Obx(
                          () => Container(
                            width: width * 0.3,
                            height: height * 0.04,
                            decoration: BoxDecoration(
                              color: controller.selectedContainer.value == 1
                                  ? Colors.pinkAccent
                                  : Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 0.3,
                                  offset: Offset(1, 2),
                                )
                              ], // War // Warna ditempatkan di dalam BoxDecoration
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              // Menambahkan border radius
                            ),
                            child: Center(
                              child: Text(
                                'Catatan',
                                style: medium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        controller.selectedContainer.value == 1
                                            ? Colors.white
                                            : Color.fromARGB(255, 87, 87, 87)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () {
                  if (controller.selectedContainer.value == 0) {
                    return SingleChildScrollView(
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRowWithDropdowns(
                                'BB/U\n(Berat Badan per Umur)'),
                            const SizedBox(height: 10),
                            LineChart1(),
                            const SizedBox(height: 30),
                            _buildRowWithDropdowns(
                                'BB/TB\n(Berat Badan perTinggi\nBadan)'),
                            const SizedBox(height: 10),
                            WeightForHeightChart(),
                            const SizedBox(height: 30),
                            _buildRowWithDropdowns(
                                'TB/U\n(Tinggi Badan per Umur)'),
                            const SizedBox(height: 10),
                            HeightByAgeChart(),
                            const SizedBox(height: 30),
                            _buildRowWithDropdowns(
                                'LK/U\n(Lingkar Kepala per Umur)'),
                            const SizedBox(height: 10),
                            HeadCircumferenceChart(),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                'Hasil Pemantauan Perkembangan',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                                onTap: () => Get.to(() =>
                                    TablePage()), // Use () => to ensure proper memory handling.

                                child: Center(
                                  child: Container(
                                    height: 60,
                                    width: width * 0.85,
                                    decoration: BoxDecoration(
                                      color: Colors.pinkAccent.shade200,
                                      border: Border.all(
                                        color: Colors.pinkAccent
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          15), // Rounded corners
                                    
                                      
                                      
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                          child: Text(
                                            'Cek Tabel Pemantauan',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Image.asset("assets/icons/add_task.png", color: Colors.white,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 50),
                                          child: Icon(IconlyBold.arrow_right_2, color: Colors.white,),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    );
                  } else if (controller.selectedContainer.value == 1) {
                    return _buildPageTwoContent();
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowWithDropdowns(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Expanded(
            flex: 2,
            child: Text(text),
          ),
        ),
        _buildAgeDropdown(),
        _buildGenderDropdown(),
      ],
    );
  }

  Widget _buildAgeDropdown() {
    final List<Map<String, dynamic>> ageRanges = [
      {'value': '0-2', 'label': '0-2 tahun'},
      {'value': '3-4', 'label': '3-4 tahun'},
      {'value': '5-6', 'label': '5-6 tahun'},
      {'value': '7-9', 'label': '7-9 tahun'},
      {'value': '10-12', 'label': '10-12 tahun'},
      {'value': '13-15', 'label': '13-15 tahun'},
      {'value': '16-18', 'label': '16-18 tahun'},
    ];

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'Pilih Usia',
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(Get.context!).hintColor,
          ),
        ),
        items: ageRanges
            .map((item) => DropdownMenuItem<String>(
                  value: item['value'],
                  child: Text(
                    item['label'],
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ))
            .toList(),
        value: controller.selectedAgeRange.value,
        onChanged: (value) {
          controller.selectedAgeRange.value = value!;
        },
        buttonStyleData: ButtonStyleData(
          height: 35,
          width: 100,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.white,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            IconlyBold.arrow_down_2,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all(6),
            thumbVisibility: WidgetStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    final List<String> genders = ['Laki-laki', 'Perempuan'];

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'Pilih Gender',
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(Get.context!).hintColor,
          ),
        ),
        items: genders
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ))
            .toList(),
        value: controller.selectedGender.value,
        onChanged: (value) {
          controller.selectedGender.value = value!;
        },
        buttonStyleData: ButtonStyleData(
          height: 35,
          width: 100,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.white,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            IconlyBold.arrow_down_2,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all(6),
            thumbVisibility: WidgetStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }

  Widget _buildPageTwoContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Text(
        'Ini adalah halaman untuk Container 2',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
