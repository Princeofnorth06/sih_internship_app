import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sih_internship_app/componets/job_small.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/models/job.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyDetailPage extends StatelessWidget {
  final Job job;

  const CompanyDetailPage({super.key, required this.job});
  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Utils.showtoast('No Address is Provided');
      throw 'Could not launch $url';
    }
  }

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
          style: const TextStyle(
              fontSize: 30,
              color: AppColors.background,
              fontWeight: FontWeight.bold),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.hub?.name ?? 'Unknown Company',
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                      job.hub?.domain != null && job.hub?.domain != ''
                          ? Row(
                              children: [
                                const Icon(Icons.domain),
                                Text(
                                  'Domain: ${job.hub?.domain}',
                                  style: const TextStyle(
                                      fontSize: 18, color: AppColors.primary),
                                ),
                              ],
                            )
                          : Container(),
                      job.hub?.location != null && job.hub?.location != ''
                          ? Row(
                              children: [
                                const Icon(Icons.location_on),
                                Text(
                                  'Location: ${job.hub?.location}',
                                  style: const TextStyle(
                                      fontSize: 16, color: AppColors.primary),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                  job.hub?.logo != null && job.hub?.logo != ''
                      ? Image.network(job.hub?.logo ?? '',
                          width: 80, height: 80)
                      : Container(),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                color: Colors.black,
                height: 2,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/icons/hired.png",
                          height: 25, width: 25),
                      job.hub?.hiredFromUs != null
                          ? Row(
                              children: [
                                const Text('Hired From Us: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "${job.hub?.hiredFromUs}",
                                  style: const TextStyle(
                                      fontSize: 18, color: AppColors.primary),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 15),
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/icons/available.png",
                          height: 30, width: 30),
                      job.hub?.jobs != null
                          ? Row(
                              children: [
                                const Text('Available Jobs: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "${job.hub!.jobs!.length}",
                                  style: const TextStyle(
                                      fontSize: 18, color: AppColors.primary),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 12),
              Row(
                children: [
                  Row(
                    children: [
                      // Image.asset("assets/icons/available.png",
                      //     height: 30, width: 30),
                      const Icon(
                        Icons.people,
                        size: 30,
                      ),
                      job.hub?.teamSize != null
                          ? Row(
                              children: [
                                const Text('Team Size: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "${job.hub!.teamSize}",
                                  style: const TextStyle(
                                      fontSize: 18, color: AppColors.primary),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  )
                ],
              ),

              // Industry Type and Domain
              const SizedBox(height: 16),
              Container(
                color: Colors.black,
                height: 2,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Row(
                    children: [
                      // Image.asset("assets/icons/available.png",
                      //     height: 30, width: 30),
                      const Icon(
                        Icons.email,
                        size: 30,
                      ),
                      job.hub?.email != null
                          ? Row(
                              children: [
                                const Text('Email: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "${job.hub!.email}",
                                  style: const TextStyle(
                                      fontSize: 18, color: AppColors.primary),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Row(
                    children: [
                      // Image.asset("assets/icons/available.png",
                      //     height: 30, width: 30),
                      const Icon(
                        Icons.call,
                        size: 30,
                      ),
                      job.hub?.contact != null
                          ? Row(
                              children: [
                                const Text('Phone: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "${job.hub!.contact}",
                                  style: const TextStyle(
                                      fontSize: 18, color: AppColors.primary),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Row(
                    children: [
                      // Image.asset("assets/icons/available.png",
                      //     height: 30, width: 30),
                      const Icon(
                        Icons.calendar_month,
                        size: 30,
                      ),
                      job.hub?.foundingDate != null
                          ? Row(
                              children: [
                                const Text('Founded On: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  DateFormat('dd/MM/yyyy').format(
                                      DateTime.parse(
                                          job.hub!.foundingDate.toString())),
                                  style: const TextStyle(
                                      fontSize: 18, color: AppColors.primary),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 16),
              Container(
                color: Colors.black,
                height: 2,
              ),
              const SizedBox(height: 16),

              // Company Description
              job.hub?.description != null && job.hub?.description != ''
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About the Company',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          job.hub?.description ?? 'No description available.',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black87),
                        ),
                      ],
                    )
                  : Container(),

              const SizedBox(height: 16),
              Container(
                color: Colors.black,
                height: 2,
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      launchURL(job.hub!.facebookId ?? "");
                    },
                    child: Image.asset(
                      "assets/icons/web.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      launchURL(job.hub!.facebookId ?? "");
                    },
                    child: Image.asset("assets/icons/instagram.png",
                        width: 40, height: 40),
                  ),
                  InkWell(
                    onTap: () {
                      launchURL(job.hub!.facebookId ?? "");
                    },
                    child: Image.asset("assets/icons/facebook.png",
                        width: 40, height: 40),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Container(
                color: Colors.black,
                height: 2,
              ),
              const SizedBox(height: 16),

              // Jobs and Mentoring Sessions
              job.hub?.jobs != null && job.hub!.jobs!.isNotEmpty
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Jobs:',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary),
                          ),
                          ...job.hub!.jobs!.map((id) => JobSmall(id: id)),
                        ],
                      ),
                    )
                  : Container(),
              const SizedBox(height: 12),

              // Apply Section
            ],
          ),
        ),
      ),
    );
  }
}
