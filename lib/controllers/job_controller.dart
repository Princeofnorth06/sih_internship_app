import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/models/job.dart';
import 'package:sih_internship_app/reopos/jobs_repo.dart';
import 'package:sih_internship_app/reopos/userauth_repo.dart';

class JobController extends GetxController {
  // Assuming you have the JobResponse class properly defined
  Rx<JobResponse> jobs = JobResponse().obs;
  Rx<Hub> hub = Hub().obs;
  // Initialize Rx<JobResponse>
  RxBool isAppling = false.obs;
// Job repository instance
  JobRepo userauthRepo = JobRepo();

  Future<void> getAllJobs() async {
    final response = await userauthRepo.getAllJobs();

    // Update the Rx value with the response
    if (response != null) {
      jobs.value = response;
    }
  }

  Future<Hub> getHubById(String id) async {
    final response = await userauthRepo.getHubById(id);

    // Update the Rx value with the response

    return response;
  }

  Future<Job> getAllJobById(String id) async {
    final response = await userauthRepo.getAllJobById(id);

    return response;
  }

  Future<void> applyNow(String id, List<dynamic> application) async {
    isAppling.value = await userauthRepo.handelApply(id, application);
  }
}
