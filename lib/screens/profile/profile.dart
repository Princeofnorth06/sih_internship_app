import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/controllers/profile_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/main.dart';
import 'package:sih_internship_app/screens/auth/login.dart';
import 'package:sih_internship_app/screens/profile/edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.background,
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            Get.offAll(const Login()); // Use Get.offAll for proper navigation
          });
        },
        child: const Icon(
          Icons.logout,
          color: AppColors.primary,
        ),
      ),
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => EditProfile());
              },
              icon: const Icon(Icons.edit))
        ],
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              Stack(
                children: [
                  Obx(() => CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            profileController.backgroundImage.value != null &&
                                    profileController
                                        .backgroundImage.value!.path.isNotEmpty
                                ? FileImage(
                                    profileController.backgroundImage.value!)
                                : null,
                        child: profileController.backgroundImage.value == null
                            ? const Icon(
                                Icons.person,
                                size: 55,
                                color: AppColors.background,
                              )
                            : null,
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Handle profile image change
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Name and Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    profileController.name.text,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.background),
                  ),
                  if (profileController.titleController.text.isNotEmpty)
                    Text(
                      profileController.titleController.text,
                      style: const TextStyle(
                          fontSize: 16, color: AppColors.background),
                    ),
                ],
              ),

              // Company and Location

              if (profileController
                  .userProfile.value.payload.address.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.location_on, color: AppColors.background),
                    const SizedBox(width: 5),
                    Text(
                      profileController.userProfile.value.payload.address,
                      style: const TextStyle(color: AppColors.background),
                    ),
                  ],
                ),

              const SizedBox(height: 20),

              // About Me
              if (profileController
                  .userProfile.value.payload.about.isNotEmpty) ...[
                const Text(
                  'About Me',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.background),
                ),
                const SizedBox(height: 10),
                Obx(() => Text(
                      profileController.userProfile.value.payload.about,
                      style: const TextStyle(color: AppColors.background),
                    )),
                const SizedBox(height: 20),
              ],

              // Experience
              if (profileController
                  .userProfile.value.payload.experience.isNotEmpty) ...[
                const Text(
                  'Experience',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.background),
                ),
                const SizedBox(height: 10),
                Obx(() => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: profileController
                          .userProfile.value.payload.experience.length,
                      itemBuilder: (context, index) {
                        // Display experience details here
                      },
                    )),
              ],

              const SizedBox(height: 20),

              // Education
              if (profileController.education.value.isNotEmpty) ...[
                const Text(
                  'Education',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.background),
                ),
                const SizedBox(height: 10),
                Obx(() => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: profileController.education.value.length,
                      itemBuilder: (context, index) {
                        // Display education details here
                      },
                    )),
              ],

              const SizedBox(height: 20),

              // Skills
              if (profileController.skills.value.isNotEmpty) ...[
                const Text(
                  'Skills',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.background),
                ),
                const SizedBox(height: 10),
                Obx(() => Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children:
                          profileController.skills.value.map<Widget>((skill) {
                        return Chip(
                          label: Text(
                            '$skill',
                            style: const TextStyle(color: AppColors.primary),
                          ),
                        );
                      }).toList(),
                    )),
              ],

              const SizedBox(height: 20),

              // Contact
              const Text(
                'Contact',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.background),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.email,
                    color: AppColors.background,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    profileController.emailController.text,
                    style: const TextStyle(color: AppColors.background),
                  ),
                ],
              ),
              if (profileController.phone.value.isNotEmpty)
                const SizedBox(height: 5),
              if (profileController.phone.value.isNotEmpty)
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: AppColors.background,
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: mq.width * 0.6,
                      child: Text(
                        profileController.phone.value,
                        style: const TextStyle(color: AppColors.background),
                      ),
                    ),
                  ],
                ),
              if (profileController.linkedIn.value.isNotEmpty)
                const SizedBox(height: 5),
              if (profileController.linkedIn.value.isNotEmpty)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.link, color: AppColors.background),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: mq.width * 0.8,
                      child: Text(
                        profileController.linkedIn.value,
                        style: const TextStyle(color: AppColors.background),
                      ),
                    ),
                  ],
                ),
              if (profileController.github.value.isNotEmpty)
                const SizedBox(height: 5),
              if (profileController.github.value.isNotEmpty)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.code, color: AppColors.background),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: mq.width * 0.8,
                      child: Text(
                        profileController.github.value,
                        style: const TextStyle(color: AppColors.background),
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 20),

              // Portfolio (Optional)
              if (profileController.portfolio.value.isNotEmpty) ...[
                const Text(
                  'Portfolio',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.background),
                ),
                const SizedBox(height: 10),
                Text(
                  profileController.portfolio.value,
                  style: const TextStyle(color: AppColors.background),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
