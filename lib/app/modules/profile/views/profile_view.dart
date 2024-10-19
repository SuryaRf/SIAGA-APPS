import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:siaga/app/data/const/font.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  color: Colors.pinkAccent,
                ),
                Positioned(
                  top: 40,
                  left: 30,
                  child: Text(
                    "Profile",
                    style: large.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      width: double.infinity, // Mengisi seluruh lebar
                      height: 50,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('assets/icons/mother.jpg'),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Susiana Sarasvatia',
                                style: medium.copyWith(
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(width: 110,), // Menambahkan spacer agar jarak otomatis antara teks dan icon
                          Icon(
                            IconlyLight.edit,
                            color: Colors.pinkAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Biodata List for Mother
     Padding(
  padding: const EdgeInsets.all(16.0),
  child: Row(
    children: [
      // Column pertama
      Expanded( // Menambahkan Expanded agar Column ini bisa fleksibel dalam mengambil ruang
        child: Column(
          children: [
            Obx(() => ListTile(
                  leading: Icon(IconlyLight.profile),
                  title: Text('Nama Ibu'),
                  subtitle: Text(controller.motherName.value),
                )),
            Obx(() => ListTile(
                  leading: Icon(IconlyLight.message),
                  title: Text('Email'),
                  subtitle: Text(controller.email.value),
                )),
            Obx(() => ListTile(
                  leading: Icon(IconlyLight.call),
                  title: Text('Nomor Telepon'),
                  subtitle: Text(controller.phoneNumber.value),
                )),
            // Add more biodata as needed
          ],
        ),
      ),

      // Spacer untuk memberi jarak antara dua kolom
      SizedBox(width: 16), 

      // Column kedua
      Expanded( // Menambahkan Expanded untuk column kedua agar layout lebih fleksibel
        child: Column(
          children: [
            Obx(() => ListTile(
                  leading: Icon(IconlyLight.profile),
                  title: Text('Nama Ibu'),
                  subtitle: Text(controller.motherName.value),
                )),
            Obx(() => ListTile(
                  leading: Icon(IconlyLight.message),
                  title: Text('Email'),
                  subtitle: Text(controller.email.value),
                )),
            Obx(() => ListTile(
                  leading: Icon(IconlyLight.call),
                  title: Text('Nomor Telepon'),
                  subtitle: Text(controller.phoneNumber.value),
                )),
            // Add more biodata as needed
          ],
        ),
      ),
    ],
  ),
),


            // Profile for Child 1
            Center(
              child: Container(
                decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(20),
                ),
                width: width * 0.9,
                padding: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Profile Anak 1',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Icon(IconlyBold.arrow_right_2, color: Colors.white,),
                    
                    ],
                  ),
                ),
              ),
            ),

            // Add Child Button
            GestureDetector(
              onTap: () {
                // Implement your action for adding a new child
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  ),
                  width: width * 0.9,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.blue,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Tambahkan Data Anak Lainnya',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Settings and Privacy
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(IconlyLight.setting),
                    title: Text('Pengaturan dan Privasi'),
                    onTap: () {
                      // Implement settings navigation
                    },
                  ),
                  ListTile(
                    leading: Icon(IconlyLight.info_circle),
                    title: Text('Bantuan dan Dukungan'),
                    onTap: () {
                      // Implement help and support navigation
                    },
                  ),
                  ListTile(
                    leading: Icon(IconlyLight.logout),
                    title: Text('Keluar'),
                    onTap: () {
                      controller.logOut(); // Call the logOut method from the controller
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
