import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:sih_internship_app/componets/customhead_dis.dart';
import 'package:sih_internship_app/controllers/job_controller.dart';
import 'package:sih_internship_app/controllers/profile_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/screens/jobs/jobs.dart'; // Import for Timer

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
    Get.put(ProfileController())
        .getUserById(Get.put(ProfileController()).uid.value);
    Get.put(JobController()).getAllJobs();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_controller.hasClients) {
        int nextPage = (_controller.page!.toInt() + 1) % 3; // Number of pages
        _controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Getting screen size
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.background),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: mq.height * 0.25,
            child: PageView(
              controller: _controller,
              children: [
                Image.asset(
                  'assets/images/slide2.jpeg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/slide3.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/slide1.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          SizedBox(
            height: mq.height * 0.02,
          ),
          const HeadDes(
            head: "Total Jobs",
            des: '1,234',
            icon: Icons.badge,
          ),
          SizedBox(
            height: mq.height * 0.01,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Jobs()));
            },
            child: const HeadDes(
              head: "Job Applied",
              des: 'Apply Now->',
              icon: Icons.check_box_rounded,
            ),
          ),
          SizedBox(
            height: mq.height * 0.01,
          ),
          const HeadDes(
            head: "New Jobs",
            des: '59',
            icon: Icons.timer,
          ),
        ],
      ),
    );
  }
}
