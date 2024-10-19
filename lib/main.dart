import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:siaga/app/modules/profile/controllers/profile_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(ProfileController());
  runApp(
    GetMaterialApp(
      color: Colors.pinkAccent,
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      
    ),
  );
}
