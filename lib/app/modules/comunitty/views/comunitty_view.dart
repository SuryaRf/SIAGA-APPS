import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/const/masseges.dart'; // Ensure this is the correct file

class ComunittyView extends StatelessWidget {
  final List<Community> communities = [
    Community(
      id: '1',
      name: 'Komunitas Anti Stunting Indonesia',
      description: 'Bersama kita cegah stunting untuk generasi sehat.',
      avatarUrl: 'https://via.placeholder.com/150',
      memberCount: 150, // Add memberCount
    ),
    Community(
      id: '2',
      name: 'Gerakan Cegah Stunting Nasional',
      description: 'Edukasi dan dukungan untuk pencegahan stunting.',
      avatarUrl: 'https://via.placeholder.com/150',
      memberCount: 80, // Add memberCount
    ),
    Community(
      id: '3',
      name: 'Forum Peduli Stunting',
      description: 'Kolaborasi bersama demi masa depan anak-anak Indonesia.',
      avatarUrl: 'https://via.placeholder.com/150',
      memberCount: 200, // Add memberCount
    ),
  ];

  ComunittyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Komunitas Anti Stunting'),
      ),
      body: ListView.builder(
        itemCount: communities.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.pinkAccent, width: 2),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(communities[index].avatarUrl),
              ),
              title: Text(communities[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(communities[index].description),
                  const SizedBox(height: 4),
                  Text(
                    '${communities[index].memberCount} Anggota',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Get.snackbar('Bergabung', 'Anda telah bergabung dengan ${communities[index].name}');
                },
                child: const Text('Gabung'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onTap: () {
                // Navigasi ke halaman chat dengan data komunitas
                Get.toNamed('/chat-page', arguments: communities[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
