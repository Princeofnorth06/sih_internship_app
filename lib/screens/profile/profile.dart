import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/controllers/profile_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/screens/auth/login.dart';
import 'package:sih_internship_app/screens/profile/create_profile.dart';
import 'package:sih_internship_app/screens/profile/edit_profile.dart';

class Profile extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: const Text('Profile',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColors.background)),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => EditProfile());
              },
              icon: const Icon(
                Icons.edit,
                color: AppColors.background,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.background,
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            Get.to(const Login());
          });
        },
        child: const Icon(
          Icons.logout,
          color: AppColors.primary,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return WideProfileLayout(controller: controller);
          } else {
            return NarrowProfileLayout(controller: controller);
          }
        },
      ),
    );
  }
}

class WideProfileLayout extends StatelessWidget {
  final ProfileController controller;

  const WideProfileLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Obx(
            () => ProfileDetails(controller: controller),
          ),
        ),
        Expanded(
          flex: 3,
          child: Obx(
            () => ProfileContent(controller: controller),
          ),
        ),
      ],
    );
  }
}

class NarrowProfileLayout extends StatelessWidget {
  final ProfileController controller;

  const NarrowProfileLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileDetails(controller: controller),
          ProfileContent(controller: controller),
        ],
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final ProfileController controller;

  const ProfileDetails({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: AppColors.greyDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              GestureDetector(
                  onTap: () =>
                      controller.pickBackgroundImage(), // Open image picker
                  child: Obx(
                    () => Container(
                      height: screenWidth > 800 ? 150 : 130,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        image: DecorationImage(
                          image: controller.backgroundImage.value != null &&
                                  controller
                                      .backgroundImage.value!.path.isNotEmpty
                              ? FileImage(controller.backgroundImage
                                  .value!) // Only use FileImage if the path is valid
                              : const AssetImage('assets/images/job.jpeg')
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                bottom: -50,
                left: screenWidth > 800 ? 40 : 30,
                child: GestureDetector(
                  onTap: () => controller
                      .pickProfileImage()
                      .then((value) {}), // Open image picker
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary,
                        width: screenWidth > 800 ? 4.0 : 3.0,
                      ),
                    ),
                    child: Obx(
                      () => CircleAvatar(
                        radius: screenWidth > 800 ? 60 : 50,
                        backgroundColor: AppColors.background,
                        backgroundImage: controller.profileImage.value !=
                                    null &&
                                controller.profileImage.value!.path.isNotEmpty
                            ? NetworkImage(controller.profile.value)
                            : const AssetImage('assets/images/job.jpeg')
                                as ImageProvider,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.userProfile.value.payload.userName ??
                      'No info available',
                  style: TextStyle(
                    fontSize: screenWidth > 800 ? 28 : 24, // Adjust font size
                    fontWeight: FontWeight.bold,
                    color: AppColors.background,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.userProfile.value.payload.address ??
                      'No info available',
                  style: const TextStyle(color: AppColors.background),
                ),
                const SizedBox(height: 16),
                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.background,
                  ),
                ),
                Text(
                  controller.userProfile.value.payload.about != ""
                      ? controller.userProfile.value.payload.about
                      : 'Add',
                  style: const TextStyle(color: AppColors.background),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Skills',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.background,
                  ),
                ),
                controller.userProfile.value.payload.skills.isNotEmpty
                    ? Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: controller.userProfile.value.payload.skills
                            .map((skill) => Chip(
                                  label: Text(
                                    skill,
                                    style: const TextStyle(
                                        color: AppColors.background),
                                  ),
                                  backgroundColor: AppColors.primary,
                                ))
                            .toList(),
                      )
                    : const Text(
                        'No skills available',
                        style: TextStyle(color: AppColors.background),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  final ProfileController controller;

  const ProfileContent({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Experience',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          controller.userProfile.value.payload.experience.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.userProfile.value.payload.experience
                      .map((exp) {
                    return ListTile(
                      title: Text(exp["title"] ?? 'No info available'),
                      subtitle: Text(
                          '${exp["company"] ?? 'No info available'} • ${exp["locationType"] ?? 'No info available'}'),
                      trailing: Text(
                        '${exp["startDateYear"] ?? 'N/A'} - ${exp["endDateYear"] ?? 'Present'}',
                      ),
                      isThreeLine: true,
                    );
                  }).toList(),
                )
              : const Text('No experience available'),
          const SizedBox(height: 16),
          const Text(
            'Education',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          controller.userProfile.value.payload.education.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      controller.userProfile.value.payload.education.map((edu) {
                    return ListTile(
                      title: Text(edu.degree ?? 'No info available'),
                      subtitle: Text(
                          '${edu.school ?? 'No info available'} • ${edu.field ?? 'No info available'}'),
                      trailing: Text(
                        '${edu.startDate?.year ?? 'N/A'} - ${edu.endDate?.year ?? 'Present'}',
                      ),
                      isThreeLine: true,
                    );
                  }).toList(),
                )
              : const Text('No education available'),
        ],
      ),
    );
  }
}
