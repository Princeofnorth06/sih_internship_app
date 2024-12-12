import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sih_internship_app/api_routes.dart';
import 'package:sih_internship_app/models/courses_model.dart';

class CoursesRepo {
  Future<List<CourseModel>> getAllCourses() async {
    final Uri url = Uri.parse(ApiRoutes.getAllCourses); // API route
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
        return coursesFromJson(jsonResponse);
        // Convert JSON to JobResponse object and return it
        //   return JobResponse.fromJson(jsonResponse);
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

 Future<CourseModel> getCoarseById(String id) async {
  final Uri url = Uri.parse("${ApiRoutes.getCourseById}$id"); // API route
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

      // Parse the JSON to CourseModel
      return CourseModel.fromJson(jsonResponse['course']);
    } else {
      // Handle failure
      if (kDebugMode) {
        print('Failed: ${response.statusCode}');
      }
      throw Exception('Failed to load course, status code: ${response.statusCode}');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error: $e');
    }
    throw Exception('Error fetching course: $e');
  }
}

}
