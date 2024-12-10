import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/controllers/job_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/models/job.dart';
import 'package:sih_internship_app/screens/jobs/jobdetails.dart';

class JobSmall extends StatefulWidget {
  const JobSmall({super.key, required this.id});
  final String id;

  @override
  State<JobSmall> createState() => _JobSmallState();
}

class _JobSmallState extends State<JobSmall> {
  JobController jobController = Get.put(JobController());
  Job? job; // Make the job nullable
  DateTime now = DateTime.now();
  DateTime? postedon;
  String? differenceFormatted;

  @override
  void initState() {
    super.initState();
    getjobbyid();
  }

  Future<void> getjobbyid() async {
    // Fetch job asynchronously

    job = await jobController.getAllJobById(widget.id);
    if (job?.createdAt != null && job!.createdAt!.isNotEmpty) {
      try {
        postedon = DateTime.parse(job!.createdAt!);
      } catch (e) {
        print('Error parsing date: $e');
      }
    }
    Duration difference = now.difference(postedon!);

    differenceFormatted = formatDuration(difference);
    setState(() {});
    // Update state after data is fetched
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => JobDetailPage(job: job??Job()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        //color: AppColors.primary,
        child: job == null
            ? const Center(
                child:
                    CircularProgressIndicator()) // Show loading indicator while fetching
            : Row(
                children: [
                  // Check if the job's hub logo exists and is non-null before displaying it
                  job!.hub?.logo != null && job!.hub!.logo!.isNotEmpty
                      ? Image.network(
                          job!.hub!.logo!,
                          height: 70,
                          width: 70,
                        )
                      : const SizedBox(),

                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      job!.title != null && job!.title!.isNotEmpty
                          ? Text(
                              job!.title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          : const Text("UnKnown",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                      job!.hub!.name != null && job!.hub!.name!.isNotEmpty
                          ? Text(
                              job!.hub!.name!,
                              style: const TextStyle(fontSize: 15),
                            )
                          : const Text("UnKnown",
                              style: TextStyle(fontSize: 15)),
                      job!.location != null && job!.location!.isNotEmpty
                          ? Row(
                              children: [
                                Text(
                                  job!.location!,
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.black54),
                                ),
                                job!.workMode != null &&
                                        job!.workMode!.isNotEmpty
                                    ? Text("(${job!.workMode})",
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54))
                                    : const SizedBox()
                              ],
                            )
                          : const Text("UnKnown",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54)),
                      Row(
                        children: [
                          postedon != null
                              ? Text(differenceFormatted!,
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.black54))
                              : const SizedBox(),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            'assets/images/logo.png',
                            height: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Apply Now',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54))
                        ],
                      )
                    ],
                  )
                ],
              ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays} days agos';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hours agos';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minutes agos';
    } else {
      return 'Just now';
    }
  }
}
