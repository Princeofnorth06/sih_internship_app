import 'dart:convert';
import 'dart:developer';

import 'package:sih_internship_app/api_routes.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sih_internship_app/models/job.dart';

class JobRepo {
  Future<JobResponse> getAllJobs() async {
    final Uri url = Uri.parse(ApiRoutes.getAllJobs); // API route
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
}
