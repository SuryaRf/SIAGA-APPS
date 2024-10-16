import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:siaga/app/data/const/color.dart';

class NavBar extends StatefulWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.pageIndex;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 90,
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: BottomAppBar(
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 80,
            width: double.infinity,
            color: Colors.white, // Change this to your desired color
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navItem(IconlyBroken.home, 0, "Beranda"),
                navItem(Icons.family_restroom_outlined, 1, "Komunitas"),
                const SizedBox(width: 50), // Space for the FAB
                navItem(IconlyBroken.paper, 2, "Buletin"),
                navItem(IconlyLight.profile, 3, "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, int index, String label) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            currentIndex = index; // Update the current index
            widget.onTap(index); // Notify parent widget
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated bar below the icon
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(bottom: currentIndex == index ? 0 : 10),
                width: 40, // You can change this width
                height: currentIndex == index ? 4 : 0, // Height changes based on selection
                decoration: BoxDecoration(
                  color: Colors.pinkAccent, // Change this to your desired color
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              ),
            ),

            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                icon,
                color: currentIndex == index ? Colors.pinkAccent : Colors.grey,
                size: currentIndex == index ? 25 : 23, // Change size on selection for animation
              ),
            ),
            const SizedBox(height: 4), // Space between icon and text
            Text(
              label,
              style: TextStyle(
                color: currentIndex == index ? Colors.pinkAccent : Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
