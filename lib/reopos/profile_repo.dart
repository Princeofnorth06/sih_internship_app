import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:sih_internship_app/api_routes.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/models/profile_model.dart';

class ProfileRepo {
  Future<bool> createUser(
      String displayName, String uuid, String email, File photoURL) async {
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
          "photoURL": photoURL.path,
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
        print('Errori: $e');
      }
      return false;
    }
  }

  Future<UserModel?> getUserByID(String uid) async {
    final Uri url = Uri.parse("${ApiRoutes.getUserById}/$uid");
    log(uid);
    log(url.toString());
    try {
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      // Check the response status
      if (response.statusCode == 200) {
        log(response.body);
        final dynamic responseBody = jsonDecode(response.body);

        if (responseBody['status'] == 'success') {
          // Parse the user data
          UserModel user = UserModel.fromJson(responseBody);
          print('ho gya');
          return user; // Return the parsed UserModel
        } else {
          // Handle failure or message
          print('Failed to fetch user mjhg: ${responseBody['message']}');
          return null;
        }
      } else {
        print('Failed with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Errori: $e');
      return null;
    }
  }

  Future<bool> editUserByID(String uid, UserModel updateData) async {
    final Uri url = Uri.parse("${ApiRoutes.edit}/$uid");
    log(uid);
    log(url.toString());
    log(updateData.payload.userName);
    log(updateData.payload.address);

    try {
      // Send PUT request with the updated user data
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updateData), // Convert the update data to JSON
      );

      // Check the response status
      if (response.statusCode == 200) {
        log(response.body);
        final dynamic responseBody = jsonDecode(response.body);

        if (responseBody['status'] == 'success') {
          print('User updated successfully');
          return true; // Return success
        } else {
          // Handle failure or message
          print('Failed to update user: ${responseBody['message']}');
          return false;
        }
      } else {
        print('Failed with status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error while updating user: $e');
      return false;
    }
  }
}
