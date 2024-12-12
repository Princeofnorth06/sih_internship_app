import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/screens/application.dart';
import 'package:sih_internship_app/screens/homepage.dart';
import 'package:sih_internship_app/screens/jobs/jobs.dart';
import 'package:sih_internship_app/screens/profile/profile.dart';
import 'package:sih_internship_app/screens/course.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Applications(),
    Profile(),
    const Course(),
  ];

  // Icons for the bottom navigation bar
  final List<IconData> _iconList = [
    Icons.home,
    Icons.mail,
    Icons.person,
    Icons.play_circle,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.background,
        shape:
            ShapeBorder.lerp(const CircleBorder(), const CircleBorder(), 0.8),
        child: const Icon(
          Icons.badge,
          color: Colors.black,
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
        backgroundColor: AppColors.background,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: _onItemTapped,
        inactiveColor: Colors.grey,
        activeColor: Colors.black,
      ),
    );
  }
}
