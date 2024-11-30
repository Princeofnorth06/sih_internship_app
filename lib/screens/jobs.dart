import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/componets/jobscontainor.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/main.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.background,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'Jobs',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.background),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Model(
                title: "SoftWare Engineer",
                location: const ['Jaipur, Bhiwari'],
                companyname: 'Rajasthan Govt.',
                companylogo: '',
                iswfh: false,
                stipend: '₹1500',
                duration: '',
                employementtype: 'Job',
                dateposted: '17/09/2024',
                lasttoapply: DateTime(2024, 10, 24)),
            Container(
              color: AppColors.primary,
              height: mq.height * 0.02,
            ),
            Model(
                title: "SoftWare Engineer",
                location: const ['Jaipur, Bhiwari'],
                companyname: 'Rajasthan Govt.',
                companylogo: '',
                iswfh: false,
                stipend: '₹1500',
                duration: '',
                employementtype: 'Job',
                dateposted: '17/09/2024',
                lasttoapply: DateTime(2024, 10, 24)),
            Container(
              color: AppColors.primary,
              height: mq.height * 0.02,
            ),
            Model(
                title: "SoftWare Engineer",
                location: const ['Jaipur, Bhiwari'],
                companyname: 'Rajasthan Govt.',
                companylogo: '',
                iswfh: false,
                stipend: '₹1500',
                duration: '',
                employementtype: 'Job',
                dateposted: '17/09/2024',
                lasttoapply: DateTime(2024, 10, 24)),
            Container(
              color: AppColors.primary,
              height: mq.height * 0.02,
            ),
            Model(
                title: "SoftWare Engineer",
                location: const ['Jaipur, Bhiwari'],
                companyname: 'Rajasthan Govt.',
                companylogo: '',
                iswfh: false,
                stipend: '₹1500',
                duration: '',
                employementtype: 'Job',
                dateposted: '17/09/2024',
                lasttoapply: DateTime(2024, 10, 24)),
            Container(
              color: AppColors.primary,
              height: mq.height * 0.02,
            ),
            Model(
                title: "SoftWare Engineer",
                location: const ['Jaipur, Bhiwari'],
                companyname: 'Rajasthan Govt.',
                companylogo: '',
                iswfh: false,
                stipend: '₹1500',
                duration: '',
                employementtype: 'Job',
                dateposted: '17/09/2004',
                lasttoapply: DateTime(2024, 10, 24))
          ],
        ),
      ),
    );
  }
}
