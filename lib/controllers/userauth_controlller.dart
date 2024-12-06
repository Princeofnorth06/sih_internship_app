import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/reopos/userauth_repo.dart';

class UserAuthController extends GetxController {
  UserauthRepo userauthRepo = UserauthRepo();
  Future<bool> auth(String email) async {
    final response = await userauthRepo.userAuth(email);

    if (response != null) {
      // Decode the response body into JSON
      final decodedResponse = jsonDecode(response.body);

      // Log the status
      log(decodedResponse["status"]);

      // Return true if the status is "success"
      return decodedResponse["status"] == "success";
    } else {
      // Handle null response
      log('Error: response is null');
      return false;
    }
  }
}
