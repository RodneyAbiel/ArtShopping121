
import 'package:artisian/pages/art_page.dart';
import 'package:artisian/pages/cart_page.dart';
import 'package:artisian/pages/inventory_login.dart';
import 'package:artisian/pages/shop_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // This method will update our selected index when user taps bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Pages to display
  final List<Widget> _pages = [
    // Shop page
    const ShopPage(),

    // Cart page
    const CartPage(),

    // Art page
    const ArtPage(),

    // Inventory page
    InventoryLogin(),
  ];

  final user = FirebaseAuth.instance.currentUser!;

//sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // background color for shop, cart, art
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            // Logo
            DrawerHeader(child: Image.asset('images/art1.jpeg')),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(color: Colors.red),
            ),

            // Other pages
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: ListTile(
                leading: Icon(Icons.light_outlined, color: Colors.white),
                title: Text(
                  "Dark or Light",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: ListTile(
                onTap: () {
                  signUserOut(); // Call the signUserOut method
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => InventoryLogin(),
                    ),
                  );
                },
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
