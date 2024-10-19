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

class TrackingGrowthView extends GetView<TrackingGrowthController> {
  const TrackingGrowthView({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller
    Get.put(TrackingGrowthController()); // Letakkan ini di sini

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(IconlyBold.arrow_left_circle, color: Colors.pinkAccent, size: 45,)),
                  ],
                ),
              ),
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
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              color: controller.selectedContainer.value == 0
                                  ? Colors.pinkAccent
                                  : Colors.grey[
                                      300],
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
                              child:  Text(
                                'Tracking',
                                style: medium.copyWith(fontWeight: FontWeight.bold, color: controller.selectedContainer.value == 0 ? Colors.white : Colors.black),
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
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              color: controller.selectedContainer.value == 1
                                  ? Colors.pinkAccent
                                  : Colors.grey[
                                      300],
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
                              child:  Text(
                                'Catatan',
                                style: medium.copyWith(fontWeight: FontWeight.bold, color: controller.selectedContainer.value == 1 ? Colors.white : Colors.black),
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
                          children: [
                            const Text('BB/U (Berat Badan per Umur)'),
                            const SizedBox(height: 10),
                            LineChartModel1(),
                            const SizedBox(height: 30),
                            const Text('BB/TB (Berat Badan per Tinggi Badan)'),
                            const SizedBox(height: 10),
                            WeightForHeightChart(),
                            const SizedBox(height: 30),
                            const Text('TB/U (Tinggi Badan per Umur)'),
                            const SizedBox(height: 10),
                            HeightByAgeChart(),
                            const SizedBox(height: 30),
                            const Text('LK/U (Lingkar Kepala per Umur)'),
                            const SizedBox(height: 10),
                            HeadCircumferenceChart(),
                            const SizedBox(height: 30),
                            const Text('Hasil Pemantauan Perkembangan'),
                            const SizedBox(height: 30),
                            Container(
                              height: 70,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.pink),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.pinkAccent
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text("HASIL PEMANTAUAN PERKEMBANGAN ", style: TextStyle(color: Colors.white),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Icon(IconlyBold.arrow_right_2, color: Colors.white,),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 30,)
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

