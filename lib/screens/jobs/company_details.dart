import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/models/job.dart';

class CompanyDetailPage extends StatelessWidget {
  final Job job;

  const CompanyDetailPage({super.key, required this.job});

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
          job.hub?.name ?? "Company Name",
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
              job.hub?.logo != null && job.hub?.logo != ''
                  ? Image.network(job.hub?.logo ?? '', width: 120, height: 120)
                  : Container(),
              const SizedBox(height: 8),
              Text(
                job.hub?.name ?? 'Unknown Company',
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ),
              const SizedBox(height: 8),

              // Industry Type and Domain
              job.hub?.domain != null && job.hub?.domain != ''
                  ? Text(
                      'Domain: ${job.hub?.domain}',
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54),
                    )
                  : Container(),
              const SizedBox(height: 8),
              job.hub?.status != null && job.hub?.status != ''
                  ? Text(
                      'Status: ${job.hub?.status}',
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54),
                    )
                  : Container(),
              const SizedBox(height: 12),

              // Company Description
              job.hub?.description != null && job.hub?.description != ''
                  ? Text(
                      job.hub?.description ?? 'No description available.',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                    )
                  : Container(),
              const SizedBox(height: 12),

              // Location
              job.hub?.location != null && job.hub?.location != ''
                  ? Text(
                      'Location: ${job.hub?.location}',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    )
                  : Container(),
              const SizedBox(height: 12),

              // Contact Information
              job.hub?.contact != null && job.hub?.contact != ''
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Contact Information:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary),
                        ),
                        Text(
                          'Phone: ${job.hub?.contact ?? 'Not available'}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black54),
                        ),
                        job.hub?.email != null && job.hub?.email != ''
                            ? Text(
                                'Email: ${job.hub?.email ?? 'Not available'}',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              )
                            : Container(),
                      ],
                    )
                  : Container(),
              const SizedBox(height: 12),

              // Social Media Links (Instagram, Facebook)
              if (job.hub?.instagramId != null || job.hub?.facebookId != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Follow Us:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    ),
                    job.hub?.instagramId != null
                        ? Text(
                            'Instagram: ${job.hub?.instagramId}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black54),
                          )
                        : Container(),
                    job.hub?.facebookId != null
                        ? Text(
                            'Facebook: ${job.hub?.facebookId}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black54),
                          )
                        : Container(),
                  ],
                ),
              const SizedBox(height: 12),

              // Team Size and Founding Date
              job.hub?.teamSize != null && job.hub?.teamSize != ''
                  ? Text(
                      'Team Size: ${job.hub?.teamSize}',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    )
                  : Container(),
              const SizedBox(height: 8),
              job.hub?.foundingDate != null && job.hub?.foundingDate != ''
                  ? Text(
                      'Founded: ${job.hub?.foundingDate}',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    )
                  : Container(),
              const SizedBox(height: 12),

              // Jobs and Mentoring Sessions
              job.hub?.jobs != null && job.hub!.jobs!.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Available Jobs:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary),
                        ),
                        ...job.hub!.jobs!.map((jobTitle) => Text(
                              jobTitle,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            )),
                      ],
                    )
                  : Container(),
              const SizedBox(height: 12),

              // Job Details Section
              const Text(
                'Job Details',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ),
              const Divider(color: AppColors.primary, thickness: 1, height: 20),
              job.type != null && job.type != ''
                  ? Text(
                      'Job Type: ${job.type}',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    )
                  : Container(),
              const SizedBox(height: 8),
              job.salaryStart != null
                  ? Text(
                      'Salary: ${job.salaryStart}',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    )
                  : Container(),
              const SizedBox(height: 8),
              job.hiringEndDate != null
                  ? Text(
                      'Application Deadline: ${DateFormat('dd MMM yyyy').format(DateTime.parse(job.hiringEndDate!))}',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    )
                  : Container(),
              const SizedBox(height: 12),

              // Apply Section
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
                  style: const TextStyle(fontSize: 16, color: Colors.black54)),

              const SizedBox(height: 20),

              // Apply Button
              ElevatedButton(
                onPressed: () {
                  // Implement the functionality for applying to the job
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
      ),
    );
  }
}
