import 'package:flutter/material.dart';
import 'package:fashion_app/screen.dart/favorite_screen.dart';
import 'package:fashion_app/screen.dart/home_screen.dart';
import 'package:fashion_app/screen.dart/settings_screen.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var selectedIndex = 0;

  final _screens = [HomeScreen(), FavoriteScreen(), SettingsScreen()];

  void changePageIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: changePageIndex,
        elevation: 0,
        currentIndex: selectedIndex,
        backgroundColor: Colors.transparent,
        showUnselectedLabels: false,
        selectedItemColor: orangeVariant,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 20,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 20,
            ),
            label: 'Settings',
          ),
        ],
      ),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: null,
          child: Image.asset(
            'assets/imgs/menu.png',
            width: 30,
          ),
        ),
        actions: [
          TextButton(
            onPressed: null,
            child: Image.asset(
              'assets/imgs/search.png',
              width: 30,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fashion Stands',
              style: TextStyle(
                color: orangeVariant,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('2022 Fashion shows'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/imgs/filter.png',
                  width: 30,
                ),
              ],
            ),
            const SizedBox(height: 10),
            _screens[selectedIndex]   //THIS IS THE PAGE TO BE LOADED
          ],
        ),
      ),
    );
  }
}
