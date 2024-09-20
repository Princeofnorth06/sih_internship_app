import 'package:flutter/material.dart';
import 'package:sih_internship_app/componets/jobscontainor.dart';
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
        backgroundColor: const Color.fromARGB(255, 122, 190, 247),
        centerTitle: true,
        title: const Text(
          'Jobs',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
              color: const Color.fromARGB(255, 137, 195, 242),
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
              color: const Color.fromARGB(255, 137, 195, 242),
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
              color: const Color.fromARGB(255, 137, 195, 242),
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
              color: const Color.fromARGB(255, 137, 195, 242),
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
