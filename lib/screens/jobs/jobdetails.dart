import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/models/job.dart';
import 'package:sih_internship_app/screens/jobs/company_details.dart';

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
      body: SingleChildScrollView(
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
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Job Title and Type
              Text(
                job.title ?? 'Unknown Job Title',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                'Type: ${job.type ?? 'Full-Time'} | Location: ${job.location ?? 'Not specified'}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 8),

              // Job Description
              const Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                      'Hiring Period: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(job.hiringStartDate!))} to ${DateFormat('yyyy-MM-dd').format(DateTime.parse(job.hiringEndDate!))}',
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
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        for (var hr in job.hrContact!)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 12),

              // Application Status
              job.application != null && job.application!.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Applications:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        for (var app in job.application!)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Application ID: ${app.appId ?? 'Unknown'}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'Status: ${app.status ?? 'Not specified'}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'Date: ${app.date ?? 'Not available'}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
