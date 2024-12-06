import 'dart:convert';
import 'dart:developer';

import 'package:sih_internship_app/api_routes.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/models/profile_model.dart';

class ProfileRepo {
  Future<bool> createUser(
      String displayName, String uuid, String email, String photoURL) async {
    final Uri url = Uri.parse(ApiRoutes.createUser);

    // Your request payload (example)
    log("display name: $displayName \n email: $email \n uuid:$uuid \n photoURL: $photoURL");
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "uid": uuid,
          "email": email,
          "photoURL": photoURL,
          "displayName": displayName,
        }),
      );

      // Check the response status
      if (response.statusCode == 200) {
        // Handle success
        Utils.showtoast("User Already Exits");
        if (kDebugMode) {
          print('Success: ${response.body}');
        }
        return false;
      } else if (response.statusCode == 201) {
        Utils.showtoast("User Created Succesfully");
        if (kDebugMode) {
          print('user creareted ${response.body}');
        }
        return true;
      } else {
        // Handle failure
        if (kDebugMode) {
          print('Failed: ${response.statusCode}');
        }
        Utils.showtoast("Internal Error Occured");
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return false;
    }
  }

  Future<dynamic> getUserByID(String uid) async {
    final Uri url = Uri.parse("${ApiRoutes.auth}/$uid");

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
