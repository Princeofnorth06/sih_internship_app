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
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'Applications',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.background,
          ),
        ),
      ),
      body: Obx(
        () {
          if (profileController.userProfile.value.payload.jobsApplied.isEmpty) {
            return const Center(
              child: Text('No job applications found'),
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
                        Text(
                          jobDetails["title"] ?? 'Job Title',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          jobDetails["description"] ?? 'No description',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Skills: ${jobDetails["skills"]?.join(", ") ?? 'N/A'}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Requirements: ${jobDetails["requirements"]?.join(", ") ?? 'N/A'}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Location: ${jobDetails["location"] ?? 'Unknown'}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Work Mode: ${jobDetails["workMode"] ?? 'N/A'}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Experience: ${jobDetails["experince"] ?? 'N/A'} years',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Salary: ${jobDetails["salaryStart"]} - ${jobDetails["salaryEnd"]}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Hiring Dates: ${formatDate(jobDetails["hiringStartDate"])} to ${formatDate(jobDetails["hiringEndDate"])}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Status: ${appliedJob["status"] ?? 'Pending'}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Applied on: ${formatDate(appliedJob["date"])}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
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
