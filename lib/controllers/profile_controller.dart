import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sih_internship_app/helpers/utils.dart';
import 'package:sih_internship_app/models/profile_model.dart';
import 'package:sih_internship_app/reopos/profile_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController extends GetxController {
  Rx<File?> profileImage = Rx<File?>(null);
  Rx<File?> backgroundImage = Rx<File?>(null);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final titleController = TextEditingController();
  final companyController = TextEditingController();
  final locationController = TextEditingController();
  RxString uid = "".obs;
  final degreeController = TextEditingController();
  final schoolController = TextEditingController();
  final fieldController = TextEditingController();
  Rx<DateTime> startDateX = DateTime.now().obs;
  Rx<DateTime> endDateX = DateTime.now().obs;
  RxString id = "".obs;
  RxString address = "".obs;
  RxString subString = "".obs;
  RxString about = "".obs;
  RxString portfolio = "".obs;
  RxString github = "".obs;
  RxString linkedIn = "".obs;
  RxString phone = "".obs;
  RxString? dob;
  RxList<dynamic> skills = [].obs;
  RxList<dynamic> jobsApplied = [].obs;
  RxList<dynamic> experience = [].obs;
  RxList<dynamic> education = [].obs;
  RxList<dynamic> achivement = [].obs;
  RxList<dynamic> project = [].obs;
  RxString profile = "".obs;

  Rx<DateTime> startDateXp = DateTime.now().obs;
  Rx<DateTime> endDateXp = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    getUserById(uid.value);
    fetchUid();
  }

  void fetchUid() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setUid(user.uid); // Set the uid to the fetched value
      emailController.text = user.email ?? "";
    } else {
      print("No user signed in");
    }
  }

  // Set the uid
  void setUid(String value) {
    uid.value = value;
  }

  Future<void> pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
      // You can also convert it to base64 or upload directly to the server here
    }
  }

  Future<void> pickBackgroundImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      backgroundImage.value = File(pickedFile.path);
      // You can also convert it to base64 or upload directly to the server here
    }
  }

  Rx<UserModel> userProfile = UserModel(
          status: '',
          payload: Payload(
              id: "",
              uid: "",
              email: "",
              isPaid: false,
              bannerImageURL: "",
              userImageURL: "",
              userName: "",
              address: "",
              subString: "",
              about: "",
              portfolio: "",
              github: "",
              linkedIn: "",
              phone: "",
              skills: [],
              jobsApplied: [],
              experience: [],
              education: [],
              achivement: [],
              project: [],
              createdAt: "",
              updatedAt: "",
              V: -1))
      .obs; // Initialize properly

  final ImagePicker _picker = ImagePicker();
  void updateProfile() {}

  Future<bool> createUser(
      String displayName, String uuid, String email, File photoURL) async {
    ProfileRepo profileRepo = ProfileRepo();
    var response =
        await profileRepo.createUser(displayName, uuid, email, photoURL);
    print(response.toString());
    return response;
  }

  Future<void> getUserById(String uuid) async {
    ProfileRepo profileRepo = ProfileRepo();
    UserModel? fetchedUser = await profileRepo.getUserByID(uuid);

    if (fetchedUser != null) {
      userProfile.value = fetchedUser;
      log(userProfile.value.payload.userImageURL);
      profileImage.value = File(userProfile.value.payload.userImageURL);
      profile.value = userProfile.value.payload.userImageURL;
      name.text = userProfile.value.payload.userName;
      id.value = userProfile
          .value.payload.id; // Assign the UserModel to the Rx<UserModel>
      if (kDebugMode) {
        print("Path h${profileImage.value!.path.toString()}");
        print(userProfile.toString());
      }
    } else {
      if (kDebugMode) {
        print('Failed to fetch user');
      }
    }
  }

  Future<void> updateUserById() async {
    ProfileRepo profileRepo = ProfileRepo();
    UserModel data = UserModel(
        status: "",
        payload: Payload(
            id: id.value,
            uid: uid.value,
            email: emailController.text,
            isPaid: false,
            bannerImageURL: userProfile.value.payload.bannerImageURL,
            userImageURL: profileImage.value!.path.toString(),
            userName: name.text,
            address: address.value,
            subString: "",
            about: about.value,
            portfolio: portfolio.value,
            github: github.value,
            linkedIn: linkedIn.value,
            dob: dob?.value,
            phone: phone.value,
            skills: skills,
            jobsApplied: jobsApplied,
            experience: experience,
            education: education,
            achivement: achivement,
            project: project,
            createdAt: userProfile.value.payload.createdAt,
            updatedAt: userProfile.value.payload.updatedAt,
            V: userProfile.value.payload.V));
    bool isUpdated = await profileRepo.editUserByID(uid.value, data);

    if (isUpdated) {
      // If the update is successful, fetch the updated user data
      UserModel? updatedUser = await profileRepo.getUserByID(uid.value);

      if (updatedUser != null) {
        // Update the profile with the new data
        userProfile.value = updatedUser;
        log(userProfile.value.payload.userImageURL);
        profileImage.value = File(userProfile.value.payload.userImageURL);
        name.text = userProfile.value.payload.userName;

        if (kDebugMode) {
          print("Profile updated successfully");
          print("Path h${profileImage.value!.path.toString()}");
          print(userProfile.toString());
        }
      } else {
        if (kDebugMode) {
          print('Failed to fetch updated user');
        }
      }
    } else {
      if (kDebugMode) {
        print('Failed to update user');
      }
    }
  }
}
