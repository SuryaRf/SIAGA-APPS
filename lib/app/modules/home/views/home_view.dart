import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:siaga/app/data/const/font.dart';
import 'package:siaga/app/data/const/items.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // Example notification count (can be dynamic, fetched from controller)
    int notificationCount = 5;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.03, top: height * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: height * 0.05,
                          width: width * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 0.3,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Image.asset(""), // Your image asset path
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.02),
                          child: Text(
                            "SELAMAT DATANG\nSUSHI",
                            style: medium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: const Icon(
                            IconlyLight.notification,
                            size: 30,
                            color: Colors.pinkAccent,
                          ),
                          onPressed: () {
                            // Action when notification icon is tapped
                          },
                        ),
                        if (notificationCount >
                            0) // Only show if there are notifications
                          Positioned(
                            right: 6,
                            top: 6,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '$notificationCount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      aspectRatio: 2.0,
                      viewportFraction: 0.8,
                    ),
                    items: items),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.06),
                child: Text(
                  "Fitur",
                  style: medium.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: height * 0.1,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Tracking Pertumbuhan",
                          style: small.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Column(
                      children: [
                        Container(
                          height: height * 0.1,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Jurnal Makanan",
                          style: small.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: height * 0.1,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Cek Jadwal",
                          style: small.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Column(
                      children: [
                        Container(
                          height: height * 0.1,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Cek Lokasi",
                          style: small.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                child: Row(
                  children: [
                    Text(
                      "Buletin Terkini",
                      style: medium.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    // Text("data")
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.17,
                      width: width * 0.875,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          color: Colors.grey),

                          child: Image.asset("name"),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      height: height * 0.17,
                      width: width * 0.875,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          color: Colors.grey),
                           child: Image.asset("name"),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      height: height * 0.17,
                      width: width * 0.875,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          color: Colors.grey),
                           child: Image.asset("name"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
