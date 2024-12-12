import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/controllers/profile_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';

class Applications extends StatefulWidget {
  const Applications({super.key});

  @override
  State<Applications> createState() => _ApplicationsState();
}

final ProfileController profileController = Get.put(ProfileController());

class _ApplicationsState extends State<Applications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: const Text(
          'Applications',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ),
      body: Obx(
        () {
          if (profileController.userProfile.value.payload.jobsApplied.isEmpty) {
            return const Center(
              child: Text(
                'No job applications found',
                style: TextStyle(color: AppColors.background, fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: profileController
                  .userProfile.value.payload.jobsApplied.length,
              itemBuilder: (context, index) {
                var appliedJob = profileController
                    .userProfile.value.payload.jobsApplied[index];
                var jobDetails = appliedJob['id'];

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Job Title
                          Row(
                            children: [
                              const Icon(Icons.work_outline,
                                  size: 24, color: Colors.blue),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  jobDetails["title"] ?? 'Job Title',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),

                          // Job Description
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.description_outlined,
                                  size: 24, color: Colors.blue),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  jobDetails["description"] ?? 'No description',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),

                          // Skills
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.build_circle_outlined,
                                  size: 24, color: Colors.blue),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Skills: ${jobDetails["skills"]?.join(", ") ?? 'N/A'}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Requirements
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.check_circle_outline,
                                  size: 24, color: Colors.blue),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Requirements: ${jobDetails["requirements"]?.join(", ") ?? 'N/A'}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Location
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.location_on_outlined,
                                  size: 24, color: Colors.blue),
                              const SizedBox(width: 8),
                              Text(
                                'Location: ${jobDetails["location"] ?? 'Unknown'}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Work Mode
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.work_outline_outlined,
                                  size: 24, color: Colors.blue),
                              const SizedBox(width: 8),
                              Text(
                                'Work Mode: ${jobDetails["workMode"] ?? 'N/A'}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Experience
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.timeline_outlined,
                                  size: 24, color: Colors.blue),
                              const SizedBox(width: 8),
                              Text(
                                'Experience: ${jobDetails["experince"] ?? 'N/A'} years',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Salary
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.attach_money_outlined,
                                  size: 24, color: Colors.green),
                              const SizedBox(width: 8),
                              Text(
                                'Salary: ${jobDetails["salaryStart"] ?? 'N/A'} - ${jobDetails["salaryEnd"] ?? 'N/A'}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Hiring Dates
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.date_range_outlined,
                                  size: 24, color: Colors.blue),
                              const SizedBox(width: 8),
                              Text(
                                'Hiring Dates: ${formatDate(jobDetails["hiringStartDate"])} to ${formatDate(jobDetails["hiringEndDate"])}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Application Status
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.info_outline,
                                  size: 24, color: Colors.blue),
                              const SizedBox(width: 8),
                              Text(
                                'Status: ${appliedJob["status"] ?? 'Pending'}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Applied Date
                          Row(
                            children: [
                              const Icon(Icons.access_time_outlined,
                                  size: 24, color: Colors.grey),
                              const SizedBox(width: 8),
                              Text(
                                'Applied on: ${formatDate(appliedJob["date"])}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                );
              },
            );
          }
        },
      ),
    );
  }

  String formatDate(String? date) {
    if (date == null) return 'N/A';
    final parsedDate = DateTime.tryParse(date);
    if (parsedDate != null) {
      return "${parsedDate.day}-${parsedDate.month}-${parsedDate.year}";
    }
    return 'N/A';
  }
}
