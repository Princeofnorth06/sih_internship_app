import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sih_internship_app/componets/jobscontainor.dart';
import 'package:sih_internship_app/controllers/job_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/main.dart';
import 'package:sih_internship_app/screens/jobs/jobdetails.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

final JobController jobController = Get.put(JobController());

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
        child: Obx(() {
          if (jobController.jobs.value.jobs != null &&
              jobController.jobs.value.jobs!.isNotEmpty) {
            // Display the job titles dynamically
            return Container(
              
              color: Colors.white,
              child: Column(
                children: jobController.jobs.value.jobs!.map((job) {
                  DateTime? hiringStartDate;
                  if (job.hiringStartDate != null &&
                      job.hiringStartDate!.isNotEmpty) {
                    try {
                      hiringStartDate = DateTime.parse(job.hiringStartDate!);
                    } catch (e) {
                      if (kDebugMode) {
                        print('Error parsing date: $e');
                      }
                    }
                  }
                  return Column(
                    children: [
                      Model(
                        mode: job.workMode ?? "Informed in Interview",
                        title: job.title ?? "", // Display job title dynamically
                        location: job.location ??
                            "Work From Home", // Modify as needed
                        companyname: job.hub?.name ??
                            'Unknown Company', // Get company name dynamically
                        companylogo: job.hub?.logo ?? '', // Get company logo
                        iswfh:
                            job.workMode == 'Remote', // Example for work mode
                        stipend:
                            '₹${job.salaryStart}', // Example for stipend (you can format it as needed)
                        duration: '', // You can add duration if available
                        employementtype: job.type ??
                            "", // Get job type (Full Time, Part Time, etc.)
                        dateposted: DateFormat('yyyy-MM-dd')
                            .format(hiringStartDate!), // Format as needed
                        lasttoapply: DateTime
                            .now(), // You can format this as per your data
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => JobDetailPage(job: job));
                        },
                        child: const Text(
                          'View details',
                          style:
                              TextStyle(color: AppColors.primary, fontSize: 20),
                        ),
                      ),
                      Container(
                        color: AppColors.primary,
                        height: mq.height * 0.02,
                      ),
                    ],
                  );
                }).toList(),
              ),
            );
          } else {
            return const Center(child: Text('No jobs available'));
          }
        }),
      ),
    );
  }
}
