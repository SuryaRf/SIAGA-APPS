import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaga/app/data/const/font.dart';
import 'package:siaga/app/data/model/news_latter.dart';
import 'package:siaga/app/data/model/news_latters.dart';

import '../controllers/education_controller.dart';

class EducationView extends GetView<EducationController> {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.06, top: height * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buletin',
                    style: medium.copyWith(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'Tingkatkan Pengetahuanmu Melalui Buletin Edukasi',
                    style: medium.copyWith(fontSize: 10),
                  ),
                  SizedBox(height: height * 0.02),
                  // Search Text Field
                  _buildSearchField(width),
                ],
              ),
            ),
            SizedBox(height: height * 0.02), 
            // List view for categories
            _buildCategoryList(),
            SizedBox(height: height * 0.02), 
            SizedBox(
        height: height * 5,
        child: ListView.builder(
          itemCount: newsLatters.length,
          itemBuilder: (context, index) {
            final news = newsLatters[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Image on the left
                  Container(
                    width: 80, // Adjust size according to your needs
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(newsLatters[index].img), // Use AssetImage or NetworkImage based on your setup
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Text content on the right
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Author and time ago
                        Row(
                          children: [
                            Text(
                              newsLatters[index].author,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '• ${news.timeAgo}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        // Headline
                        Text(
                          news.headline,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Category
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent.shade100,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                news.category,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.bookmark, color: Colors.blue), // Bookmark icon
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField(double width) {
    return Container(
      width: width * 0.88,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add search logic here if needed
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    final List<String> categories = [
      'Kesehatan',
      'Nutrisi',
      'Pendidikan',
      'Perkembangan Anak',
      'Pencegahan Stunting',
      'Kegiatan Komunitas',
    ];

    // Track the currently selected category index
    int selectedIndex = 0;

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index; // Check if the current index is selected
          return GestureDetector(
            onTap: () {
              // Update the selected index on tap
              selectedIndex = index;
              // Refresh the state to reflect the change
              (context as Element).markNeedsBuild(); 
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? Colors.pinkAccent : Colors.grey[200], // Change color based on selection
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black, // Change text color based on selection
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
