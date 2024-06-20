import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int) onTabChange;
  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: Colors.blueGrey, // Color on unselected icon
        activeColor: Colors.black87, // Color on selected icon
        tabActiveBorder:
            Border.all(color: Colors.black12), // Border on selected icon
        tabBackgroundColor:
            Colors.grey.shade400, // Background color on selected icon
        mainAxisAlignment: MainAxisAlignment.center,
        onTabChange: onTabChange, // Directly use the callback
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Shop",
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: "Cart",
          ),
          GButton(
            icon: Icons.pages,
            text: "Art",
          ),
          GButton(
            icon: Icons.inventory_2,
            text: "Inventory",
          ),
        ],
      ),
    );
  }
}
