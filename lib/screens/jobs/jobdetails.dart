import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/models/job.dart';
import 'package:sih_internship_app/screens/jobs/company_details.dart';
import 'package:sih_internship_app/screens/jobs/jobs.dart';

class JobDetailPage extends StatelessWidget {
  final Job job;

  const JobDetailPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.background,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: Text(
            job.title ?? "Job Title",
            style: const TextStyle(color: AppColors.background),
          ),
          backgroundColor: AppColors.primary,
        ),
        body: job.title != null
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Company Logo and Name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          job.hub?.logo != null && job.hub!.logo != ''
                              ? GestureDetector(
                                  onTap: () {
                                    Get.to(() => CompanyDetailPage(
                                          job: job,
                                        ));
                                  },
                                  child: Image.network(job.hub!.logo!,
                                      width: 100, height: 100))
                              : Container(),
                          TextButton(
                              onPressed: () {
                                Get.to(() => CompanyDetailPage(
                                      job: job,
                                    ));
                              },
                              child: const Text("View Company Detail"))
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        job.hub?.name ?? 'Unknown Company',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),

                      // Job Title and Type
                      Text(
                        job.title ?? 'Unknown Job Title',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Type: ${job.type ?? 'Full-Time'} | Location: ${job.location ?? 'Not specified'}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),

                      // Job Description
                      const Text(
                        'Description:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        job.description ?? 'No description available.',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 12),

                      // Skills & Requirements
                      job.skills != null && job.skills!.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Skills Required:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Wrap(
                                  spacing: 8.0,
                                  children: job.skills!
                                      .map((skill) => Chip(label: Text(skill)))
                                      .toList(),
                                ),
                              ],
                            )
                          : Container(),
                      const SizedBox(height: 12),
                      job.requirements != null && job.requirements!.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Job Requirements:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                for (var requirement in job.requirements!)
                                  Text(
                                    '• $requirement',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                              ],
                            )
                          : Container(),
                      const SizedBox(height: 12),

                      // Salary Range
                      job.salaryStart != null && job.salaryEnd != null
                          ? Text(
                              'Salary: ₹${job.salaryStart} - ₹${job.salaryEnd}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          : Container(),
                      const SizedBox(height: 12),

                      // Hiring Dates
                      job.hiringStartDate != null && job.hiringEndDate != null
                          ? Text(
                              'Hiring Period: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(job.hiringStartDate!))} to ${DateFormat('dd/MM/yyyy').format(DateTime.parse(job.hiringEndDate!))}',
                              style: const TextStyle(fontSize: 16),
                            )
                          : Container(),
                      const SizedBox(height: 12),

                      // Work Mode
                      Text(
                        'Work Mode: ${job.workMode ?? 'Not specified'}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 12),

                      // HR Contact Info
                      job.hrContact != null && job.hrContact!.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'HR Contact:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                for (var hr in job.hrContact!)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name: ${hr.name ?? 'Unknown'}',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          'Email: ${hr.email ?? 'Unknown'}',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            )
                          : Container(),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'How to Apply:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Click on the apply button to Apply",
                          style:
                              TextStyle(fontSize: 16, color: Colors.black54)),

                      const SizedBox(height: 20),

                      // Apply Button
                      ElevatedButton(
                        onPressed: () {
                          // Implement the functionality for applying to the job
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Apply Now',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hiring is Over Please Apply Other Jobs",
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const Jobs());
                      },
                      child: const Text(
                        "Apply Now",
                        style: TextStyle(color: Colors.blue, fontSize: 30),
                      ))
                ],
              )));
  }
}
