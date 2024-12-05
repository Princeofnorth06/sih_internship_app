import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/controllers/profile_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';

class EditProfile extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Edit Profile',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Editable Profile Details
              TextFormField(
                initialValue:
                    profileController.userProfile.value.profileData.name,
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  profileController.userProfile.update((val) {
                    val?.profileData.name = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue:
                    profileController.userProfile.value.profileData.role,
                decoration: const InputDecoration(labelText: 'Role'),
                onChanged: (value) {
                  profileController.userProfile.update((val) {
                    val?.profileData.role = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue:
                    profileController.userProfile.value.profileData.address,
                decoration: const InputDecoration(labelText: 'Address'),
                onChanged: (value) {
                  profileController.userProfile.update((val) {
                    val?.profileData.address = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue:
                    profileController.userProfile.value.profileData.about,
                decoration: const InputDecoration(labelText: 'About'),
                maxLines: 3,
                onChanged: (value) {
                  profileController.userProfile.update((val) {
                    val?.profileData.about = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Editable Skills
              const Text(
                'Skills',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Obx(() {
                return Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    ...profileController.userProfile.value.profileData.skills
                        .map((skill) {
                      return Chip(
                        label: Text(skill),
                        deleteIcon: const Icon(Icons.close),
                        onDeleted: () {
                          profileController.removeSkill(skill);
                        },
                      );
                    }).toList(),
                    InputChip(
                      label: const Text('Add Skill'),
                      onPressed: () => _addSkillDialog(context),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 16),

              // Editable Experience
              const Text(
                'Experience',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Obx(() {
                return Column(
                  children: profileController
                      .userProfile.value.profileData.experiences
                      .map((exp) {
                    return ListTile(
                      title: TextFormField(
                        initialValue: exp.title,
                        decoration:
                            const InputDecoration(labelText: 'Job Title'),
                        onChanged: (value) {
                          exp.title = value;
                        },
                      ),
                      subtitle: TextFormField(
                        initialValue: exp.company,
                        decoration: const InputDecoration(labelText: 'Company'),
                        onChanged: (value) {
                          exp.company = value;
                        },
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: TextFormField(
                          initialValue: exp.location,
                          decoration:
                              const InputDecoration(labelText: 'Location'),
                          onChanged: (value) {
                            exp.location = value;
                          },
                        ),
                      ),
                      isThreeLine: true,
                    );
                  }).toList(),
                );
              }),
              const SizedBox(height: 16),

              // Editable Education
              const Text(
                'Education',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Obx(() {
                return Column(
                  children: profileController
                      .userProfile.value.profileData.education
                      .map((edu) {
                    return ListTile(
                      title: TextFormField(
                        initialValue: edu.degree,
                        decoration: const InputDecoration(labelText: 'Degree'),
                        onChanged: (value) {
                          edu.degree = value;
                        },
                      ),
                      subtitle: TextFormField(
                        initialValue: edu.school,
                        decoration: const InputDecoration(labelText: 'School'),
                        onChanged: (value) {
                          edu.school = value;
                        },
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: TextFormField(
                          initialValue: edu.field,
                          decoration: const InputDecoration(labelText: 'Field'),
                          onChanged: (value) {
                            edu.field = value;
                          },
                        ),
                      ),
                      isThreeLine: true,
                    );
                  }).toList(),
                );
              }),
              const SizedBox(height: 16),

              // Save Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary),
                  onPressed: () {
                    profileController
                        .saveProfile(); // Implement the save function
                  },
                  child: const Text(
                    'Save',
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

  void _addSkillDialog(BuildContext context) {
    final skillController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Skill'),
          content: TextField(
            controller: skillController,
            decoration: const InputDecoration(hintText: 'Enter skill'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (skillController.text.isNotEmpty) {
                  profileController.addSkill(skillController.text);
                }
                Get.back();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
