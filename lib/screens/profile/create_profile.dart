import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/controllers/profile_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/screens/home_screen.dart';

class CreateProfile extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  // TextEditingController titleController = TextEditingController();
  // TextEditingController companyController = TextEditingController();
  // TextEditingController locationController = TextEditingController();
  // TextEditingController descriptionController = TextEditingController();
  CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Create Profile',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.background),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Background Image
              // GestureDetector(
              //   onTap: () {
              //     profileController.pickBackgroundImage();
              //   },
              //   child: Obx(() {
              //     return Container(
              //       height: 200,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         color: Colors.grey[300],
              //         image: profileController.backgroundImage.value != null
              //             ? DecorationImage(
              //                 image: FileImage(
              //                   profileController.backgroundImage.value!,
              //                 ),
              //                 fit: BoxFit.cover,
              //               )
              //             : null,
              //       ),
              //       child: profileController.backgroundImage.value == null
              //           ? const Center(
              //               child: Text(
              //                 'Tap to upload background image',
              //                 style: TextStyle(color: Colors.black54),
              //               ),
              //             )
              //           : null,
              //     );
              //   }),
              // ),
              const SizedBox(height: 16),

              // Profile Image
              GestureDetector(
                onTap: () {
                  profileController.pickProfileImage();
                },
                child: Obx(() {
                  return CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    backgroundImage:
                        profileController.profileImage.value != null
                            ? FileImage(profileController.profileImage.value!)
                            : null,
                    child: profileController.profileImage.value == null
                        ? const Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.black54,
                          )
                        : null,
                  );
                }),
              ),
              const SizedBox(height: 16),

              // Name, Role, Address, About fields (as in EditProfile)
              TextFormField(
                controller: profileController.name,
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  profileController.userProfile.update((val) {
                    val?.userName = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                readOnly: true,
                controller: profileController.emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  profileController.userProfile.update((val) {
                    val?.email = value;
                  });
                },
              ),
              // TextFormField(
              //   decoration: const InputDecoration(labelText: 'Role'),
              //   onChanged: (value) {
              //     profileController.userProfile.update((val) {
              //       val?.role = value;
              //     });
              //   },
              // ),
              // const SizedBox(height: 16),
              // TextFormField(
              //   decoration: const InputDecoration(labelText: 'Address'),
              //   onChanged: (value) {
              //     profileController.userProfile.update((val) {
              //       val?.address = value;
              //     });
              //   },
              // ),
              // const SizedBox(height: 16),
              // TextFormField(
              //   decoration: const InputDecoration(labelText: 'About'),
              //   maxLines: 3,
              //   onChanged: (value) {
              //     profileController.userProfile.update((val) {
              //       val?.about = value;
              //     });
              //   },
              // ),
              // const SizedBox(height: 16),
              // TextFormField(
              //   decoration: const InputDecoration(
              //       labelText: 'Skills (comma-separated)'),
              //   onChanged: (value) {
              //     List<String> skills =
              //         value.split(',').map((skill) => skill.trim()).toList();
              //     profileController.userProfile.update((val) {
              //       val?.skills = skills;
              //     });
              //   },
              // ),
              // const SizedBox(height: 16),

              // // Experience
              // const Text(
              //   'Add Experience',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(height: 16),
              // TextFormField(
              //   controller: titleController,
              //   decoration: const InputDecoration(labelText: 'Title'),
              // ),
              // const SizedBox(height: 16),
              // TextFormField(
              //   controller: companyController,
              //   decoration: const InputDecoration(labelText: 'Company'),
              // ),
              // const SizedBox(height: 16),
              // TextFormField(
              //   controller: locationController,
              //   decoration: const InputDecoration(labelText: 'Location'),
              // ),
              // const SizedBox(height: 16),
              // TextFormField(
              //   controller: descriptionController,
              //   decoration: const InputDecoration(labelText: 'Description'),
              //   maxLines: 3,
              // ),
              // const SizedBox(height: 16),

              // Center(
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor: AppColors.primary),
              //     onPressed: () {
              //       // Add new Experience to the list
              //       var newExperience = (
              //         title: titleController.text,
              //         company: companyController.text,
              //         location: locationController.text,
              //         description: descriptionController.text,
              //         startDate:
              //             DateTime.now(), // You can adjust to select a date
              //         endDate: DateTime.now(),
              //       );

              //       profileController.userProfile.update((val) {
              //         val?.experience ??= [];
              //         val?.experience.add(newExperience);
              //       });

              //       // Clear the input fields after adding
              //       titleController.clear();
              //       companyController.clear();
              //       locationController.clear();
              //       descriptionController.clear();
              //     },
              //     child: const Text(
              //       'Add Experience',
              //       style: TextStyle(color: AppColors.background),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 16),

              // // GitHub
              // TextFormField(
              //   decoration: const InputDecoration(labelText: 'GitHub'),
              //   onChanged: (value) {
              //     profileController.userProfile.update((val) {
              //       val?.github = value;
              //     });
              //   },
              // ),
              // const SizedBox(height: 16),

              // // LinkedIn
              // TextFormField(
              //   decoration: const InputDecoration(labelText: 'LinkedIn'),
              //   onChanged: (value) {
              //     profileController.userProfile.update((val) {
              //       val?.linkedIn = value;
              //     });
              //   },
              // ),
              // const SizedBox(height: 16),
              // // Skills, Experience, Education (as in EditProfile)
              // // Include the rest of the fields as in EditProfile

              // Save Button
              const SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary),
                  onPressed: () async {
                    profileController
                        .createUser(
                            profileController.name.text,
                            profileController.uid!.value,
                            profileController.emailController.text,
                            profileController.profileImage.toString())
                        .then((value) {
                      Get.to(() => const HomePage());
                    });
                  },
                  child: const Text(
                    'Create Profile',
                    style: TextStyle(color: AppColors.background),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
