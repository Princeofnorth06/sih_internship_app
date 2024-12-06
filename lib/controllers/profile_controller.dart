import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/models/profile_model.dart';
import 'package:sih_internship_app/reopos/profile_repo.dart';

class ProfileController extends GetxController {
  Rx<File?> profileImage = Rx<File?>(null);
  Rx<File?> backgroundImage = Rx<File?>(null);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController name = TextEditingController();
  RxString uid = "".obs;

  // Set the uid
  void setUid(String value) {
    uid.value = value;
  }

  // Method to pick profile image
  Future<void> pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  // Method to pick background image
  Future<void> pickBackgroundImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      backgroundImage.value = File(pickedFile.path);
    }
  }

  Rx<UserModel> userProfile =
      UserModel(uid: "", email: "", userImageURL: "").obs;

  final ImagePicker _picker = ImagePicker();

  Future<bool> createUser(
      String displayName, String uuid, String email, String photoURL) async {
    ProfileRepo profileRepo = ProfileRepo();
    var response =
        await profileRepo.createUser(displayName, uuid, email, photoURL);
    print(response.toString());
    return response;
  }

  Future<void> getUserById(String uuid) async {
    ProfileRepo profileRepo = ProfileRepo();
    userProfile = await profileRepo.getUserByID(uuid);
    if (kDebugMode) {
      print(userProfile.toString());
    }
  }
}
