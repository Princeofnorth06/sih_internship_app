import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:sih_internship_app/screens/application.dart';
import 'package:sih_internship_app/screens/homepage.dart';
import 'package:sih_internship_app/screens/jobs.dart';
import 'package:sih_internship_app/screens/profile.dart';
import 'package:sih_internship_app/screens/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Application(),
    const Profile(),
    const Setting(),
  ];

  // Icons for the bottom navigation bar
  final List<IconData> _iconList = [
    Icons.home,
    Icons.mail,
    Icons.person,
    Icons.settings,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 122, 190, 247),
        shape:
            ShapeBorder.lerp(const CircleBorder(), const CircleBorder(), 0.8),
        child: const Icon(
          Icons.badge,
          color: Colors.white,
        ),
        onPressed: () {
          // Navigate to the Jobs page when the FAB is clicked
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Jobs()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center,
        backgroundColor: const Color.fromARGB(255, 122, 190, 247),
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: _onItemTapped,
        inactiveColor: Colors.white,
        activeColor: Colors.black,
      ),
    );
  }
}
