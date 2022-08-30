import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatefulWidget {
  final selectedIndex;
  NavBar(this.selectedIndex);
  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          {
            Get.toNamed('/dog_bmi_form');
          }
          break;
        case 1:
          {
            Get.toNamed('/welcome_screen');
          }
          break;
        case 2:
          {
            Get.toNamed('/breed_collection');
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.pets),
          label: 'BMI',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home Page',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.collections),
          label: 'Collection',
        ),
      ],
      currentIndex: widget.selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
