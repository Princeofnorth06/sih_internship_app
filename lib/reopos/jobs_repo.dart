import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter_launcher_icons/config/config.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/api_routes.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sih_internship_app/controllers/job_controller.dart';
import 'package:sih_internship_app/controllers/profile_controller.dart';
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/models/job.dart';

class JobRepo {
  //JobController jobController = Get.put(JobController());
  Future<JobResponse> getAllJobs() async {
    final Uri url = Uri.parse(ApiRoutes.getAllJobs); // API route
    log(url.toString());
    try {
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Parse the response body as JSON
        final jsonResponse = jsonDecode(response.body);
        log(response.body);
        if (kDebugMode) {
          print('Success: $jsonResponse');
        }

        // Convert JSON to JobResponse object and return it
        return JobResponse.fromJson(jsonResponse);
      } else {
        // Handle failure
        if (kDebugMode) {
          print('Failed: ${response.statusCode}');
        }
        throw Exception(
            'Failed to load jobs, status code: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception('Error fetching jobs: $e');
    }
  }

  Future<Job> getAllJobById(String id) async {
    final Uri url = Uri.parse("${ApiRoutes.getAllJobById}/$id"); // API route
    print(url.toString());
    try {
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Parse the response body as JSON
        final jsonResponse = jsonDecode(response.body);
        log(response.body);
        if (kDebugMode) {
          print('Success: $jsonResponse');
        }

        // Convert JSON to JobResponse object and return it
        return Job.fromJson(jsonResponse);
      } else {
        // Handle failure
        if (kDebugMode) {
          print('Failed: ${response.statusCode}');
        }
        throw Exception(
            'Failed to load jobs, status code: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception('Error fetching jobs: $e');
    }
  }

  Future<bool> handelApply(String id, List<dynamic> application) async {
    String date = DateTime.now().toIso8601String();

    try {
      // Update job application
      print(Uri.parse('${ApiRoutes.getUserById}/$id'));
      print(Get.put(ProfileController()).uid.value);
      print(date);
      final response = await http.put(
        Uri.parse('${ApiRoutes.getAllJobById}/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'application': [
            ...application,
            {
              'id': Get.put(ProfileController()).uid.value,
              'date': date,
              'status': 'Pending'
            }
          ],
        }),
      );
      print('status code:${response.statusCode}');
      if (response.statusCode != 200) {
        throw Exception('Failed to apply for job');
      }

      // Get user data
      final userResponse = await http.get(
        Uri.parse(
            '${ApiRoutes.getUserById}/${Get.put(ProfileController()).uid.value}'),
      );
      print('status code:${userResponse.statusCode}');

      if (userResponse.statusCode != 200) {
        throw Exception('Failed to fetch user data');
      }

      final userData = jsonDecode(userResponse.body);
      List<dynamic> jobsApplied = userData['payload']['jobsApplied'];

      // Update user jobs applied
      final updateResponse = await http.put(
        Uri.parse(
            '${ApiRoutes.auth}/${Get.put(ProfileController()).uid.value}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'jobsApplied': [
            ...jobsApplied,
            {'id': id, 'date': date, 'status': 'Pending'}
          ],
        }),
      );
      print('status code:${updateResponse.statusCode}');

      if (updateResponse.statusCode != 200) {
        throw Exception('Failed to update user jobs applied');
      }

      Utils.showtoast('Applied Successfully');
      return true;
    } catch (err) {
      Utils.showtoast(err.toString());
      return false;
    } finally {}
  }

  Future<Hub> getHubById(String id) async {
    final Uri url = Uri.parse("${ApiRoutes.getHubById}/$id"); // API route
    print(url.toString());
    try {
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Parse the response body as JSON
        final jsonResponse = jsonDecode(response.body);
        log(response.body);
        if (kDebugMode) {
          print('Success: $jsonResponse');
        }

        // Convert JSON to JobResponse object and return it
        return Hub.fromJson(jsonResponse);
      } else {
        // Handle failure
        if (kDebugMode) {
          print('Failed: ${response.statusCode}');
        }
        throw Exception(
            'Failed to load jobs, status code: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception('Error fetching jobs: $e');
    }
  }
}
