import 'package:sih_internship_app/api_routes.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserauthRepo {
  Future<dynamic> userAuth(String email) async {
    final Uri url = Uri.parse("${ApiRoutes.auth}/$email");

    // Your request payload (example)

    try {
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      // Check the response status
      if (response.statusCode == 200) {
        // Handle success

        if (kDebugMode) {
          print('Success: ${response.body}');
        }
        return response;
      } else {
        // Handle failure
        if (kDebugMode) {
          print('Failed: ${response.statusCode}');
        }
        return response;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
