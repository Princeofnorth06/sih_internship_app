import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/models/job.dart';
import 'package:sih_internship_app/reopos/jobs_repo.dart';
import 'package:sih_internship_app/reopos/userauth_repo.dart';

class JobController extends GetxController {
  // Assuming you have the JobResponse class properly defined
  Rx<JobResponse> jobs = JobResponse().obs; // Initialize Rx<JobResponse>

// Job repository instance
  JobRepo userauthRepo = JobRepo();

  Future<void> getAllJobs() async {
    final response = await userauthRepo.getAllJobs();

    // Update the Rx value with the response
    if (response != null) {
      jobs.value = response;
    }
  }
}
