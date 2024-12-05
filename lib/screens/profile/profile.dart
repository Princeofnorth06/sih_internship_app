import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/controllers/profile_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/screens/profile/edit_profile.dart';

class Profile extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Cover Image with tap gesture to pick image
              GestureDetector(
                onTap: () => controller
                    .updateProfileBackgroundImage(), // Open image picker
                child: Obx(() => Container(
                      height: screenWidth > 800 ? 150 : 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: controller.userProfile.value.profileData
                                .profileImagebackground
                                .contains('assets')
                            ? AssetImage(controller.userProfile.value
                                .profileData.profileImagebackground)
                            : FileImage(File(controller
                                .userProfile
                                .value
                                .profileData
                                .profileImagebackground)) as ImageProvider,
                        fit: BoxFit.cover,
                      )
                          // Show selected image

                          ),
                    )),
              ),

              // Profile Image with tap gesture to pick image
              Positioned(
                bottom: -50,
                left: screenWidth > 800 ? 40 : 30,
                child: GestureDetector(
                  onTap: () =>
                      controller.updateProfileImage(), // Open image picker
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary,
                        width: screenWidth > 800 ? 4.0 : 3.0,
                      ),
                    ),
                    child: Obx(() => CircleAvatar(
                          radius: screenWidth > 800 ? 60 : 50,
                          backgroundColor: AppColors.background,
                          backgroundImage: controller
                                  .userProfile.value.profileData.profileImage
                                  .contains('assets')
                              ? AssetImage(controller
                                  .userProfile.value.profileData.profileImage)
                              : FileImage(File(controller.userProfile.value
                                  .profileData.profileImage)) as ImageProvider,
                        )),
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
                  controller.userProfile.value.profileData.name,
                  style: TextStyle(
                    fontSize: screenWidth > 800 ? 28 : 24, // Adjust font size
                    fontWeight: FontWeight.bold,
                    color: AppColors.background,
                  ),
                ),
                Text(
                  controller.userProfile.value.profileData.role,
                  style: const TextStyle(color: AppColors.background),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.userProfile.value.profileData.address,
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
                  controller.userProfile.value.profileData.about,
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
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: controller.userProfile.value.profileData.skills
                      .map((skill) => Chip(
                            label: Text(
                              skill,
                              style:
                                  const TextStyle(color: AppColors.background),
                            ),
                            backgroundColor: AppColors.primary,
                          ))
                      .toList(),
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
          ...controller.userProfile.value.profileData.experiences.map((exp) {
            return ListTile(
              title: Text(exp.title),
              subtitle: Text('${exp.company} • ${exp.location}'),
              trailing: Text(
                '${exp.startDate.year} - ${exp.endDate?.year ?? 'Present'}',
              ),
              isThreeLine: true,
            );
          }).toList(),
          const SizedBox(height: 16),
          const Text(
            'Education',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...controller.userProfile.value.profileData.education.map((edu) {
            return ListTile(
              title: Text(edu.degree),
              subtitle: Text('${edu.school} • ${edu.field}'),
              trailing: Text(
                '${edu.startDate.year} - ${edu.endDate?.year ?? 'Present'}',
              ),
              isThreeLine: true,
            );
          }).toList(),
        ],
      ),
    );
  }
}
