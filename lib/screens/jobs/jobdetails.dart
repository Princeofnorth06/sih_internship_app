import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/models/job.dart';
import 'package:sih_internship_app/screens/application.dart';
import 'package:sih_internship_app/screens/jobs/company_details.dart';
import 'package:sih_internship_app/screens/jobs/jobs.dart';

class JobDetailPage extends StatefulWidget {
  final Job job;

  const JobDetailPage({super.key, required this.job});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    jobController.isAppling.value = widget.job.application!
        .any((app) => app.id == profileController.uid.value);
    print(jobController.isAppling.value);
    //jobController.isAppling.value=
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
          title: const Text(
            "Job Details",
            style: TextStyle(color: AppColors.background),
          ),
          backgroundColor: AppColors.primary,
        ),
        body: widget.job.title != null
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.job.title != null && widget.job.title != ""
                                  ? Text(
                                      widget.job.title!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  : const Text('Unknown',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  widget.job.hub!.name != null &&
                                          widget.job.hub!.name != ""
                                      ? Text("${widget.job.hub!.name!},",
                                          style: const TextStyle(fontSize: 13))
                                      : const Text("Unknown,",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54)),
                                  const Icon(
                                    Icons.location_on,
                                    size: 15,
                                    color: Colors.black54,
                                  ),
                                  widget.job.hub!.location != null &&
                                          widget.job.hub!.location != ""
                                      ? Text(widget.job.hub!.location!,
                                          style: const TextStyle(fontSize: 13))
                                      : const Text("Unknown",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black54)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    size: 13,
                                  ),
                                  Text(
                                      'Posted On: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(widget.job.createdAt!))}')
                                ],
                              )
                            ],
                          ),
                          widget.job.hub?.logo != null &&
                                  widget.job.hub!.logo != ''
                              ? GestureDetector(
                                  onTap: () {
                                    Get.to(() => CompanyDetailPage(
                                          job: widget.job,
                                        ));
                                  },
                                  child: Image.network(widget.job.hub!.logo!,
                                      width: 100, height: 100))
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
                          const Icon(Icons.money),
                          const Text(
                            ' CTC (Annual): ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                              ' ${widget.job.salaryStart}-${widget.job.salaryEnd}')
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.lock_clock),
                          const Text(
                            ' Apply By: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                              ' ${DateFormat('dd/MM/yyyy').format(DateTime.parse(widget.job.hiringStartDate!))}')
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.people),
                          const Text(
                            ' Number of Opening: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(' ${widget.job.numberOfOpenings}')
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.work),
                          const Text(
                            ' Type: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(widget.job.type ?? 'Full-Time'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        color: Colors.black,
                        height: 2,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'About the Job:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.job.description ?? 'No description available.',
                        //),
                      ),
                      const SizedBox(height: 8),
                      widget.job.skills != null && widget.job.skills!.isNotEmpty
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
                                  children: widget.job.skills!
                                      .map((skill) => Chip(label: Text(skill)))
                                      .toList(),
                                ),
                              ],
                            )
                          : Container(),
                      const SizedBox(height: 12),
                      widget.job.requirements != null &&
                              widget.job.requirements!.isNotEmpty
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
                                for (var requirement
                                    in widget.job.requirements!)
                                  Text(
                                    '• $requirement',
                                    // style: const TextStyle(fontSize: 16),
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
                      ElevatedButton(
                          onPressed: () {
                            // Implement the functionality for applying to the job
                            jobController.isAppling.value == false
                                ? jobController.applyNow(
                                    widget.job.id!, widget.job.application!)
                                : Utils.showtoast('Already Applied');
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Obx(
                            () => jobController.isAppling.value == false
                                ? const Text(
                                    'Apply Now',
                                    // : "Applied",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  )
                                : const Text(
                                    'Applied',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                          )),
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
