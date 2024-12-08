import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sih_internship_app/controllers/profile_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';

class EditProfile extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.background,
          ),
          onPressed: () {
            Get.back();
          },
        ),
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
                    profileController.userProfile.value.payload.userName,
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  profileController.name.text = value;
                },
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              TextFormField(
                initialValue:
                    profileController.userProfile.value.payload.address,
                decoration: const InputDecoration(labelText: 'Address'),
                onChanged: (value) {
                  profileController.address.value = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: profileController.userProfile.value.payload.about,
                decoration: const InputDecoration(labelText: 'About'),
                maxLines: null,
                onChanged: (value) {
                  profileController.about.value = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                initialValue: profileController.userProfile.value.payload.phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                onChanged: (value) {
                  profileController.phone.value = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue:
                    profileController.userProfile.value.payload.linkedIn,
                decoration: const InputDecoration(labelText: 'LinkedIn'),
                onChanged: (value) {
                  profileController.linkedIn.value = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue:
                    profileController.userProfile.value.payload.github,
                decoration: const InputDecoration(labelText: 'Github'),
                onChanged: (value) {
                  profileController.github.value = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue:
                    profileController.userProfile.value.payload.portfolio,
                decoration: const InputDecoration(labelText: 'Portfolio'),
                onChanged: (value) {
                  profileController.portfolio.value = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: profileController.userProfile.value.payload.dob,
                decoration: const InputDecoration(labelText: 'Date of Birth'),
                onChanged: (value) {
                  profileController.dob!.value = value;
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
                    ...profileController.skills.map((skill) {
                      return Chip(
                        label: Text(skill),
                        deleteIcon: const Icon(Icons.close),
                        onDeleted: () {
                          profileController.skills.remove(skill);
                          // profileController.userProfile.update((val) {
                          //   val?.payload.skills.remove(skill);
                          // });
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
                  children: [
                    ...profileController.experience.map((exp) {
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
                          decoration:
                              const InputDecoration(labelText: 'Company'),
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
                        leading: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            profileController.experience.remove(exp);
                          },
                        ),
                      );
                    }).toList(),
                    ElevatedButton(
                      onPressed: () => _addExperienceDialog(context),
                      child: const Text('Add Experience'),
                    ),
                  ],
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
                  children: [
                    ...profileController.education.map((edu) {
                      return ListTile(
                        title: TextFormField(
                          initialValue: edu.degree,
                          decoration:
                              const InputDecoration(labelText: 'Degree'),
                          onChanged: (value) {
                            edu.degree = value;
                          },
                        ),
                        subtitle: TextFormField(
                          initialValue: edu.school,
                          decoration:
                              const InputDecoration(labelText: 'School'),
                          onChanged: (value) {
                            edu.school = value;
                          },
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: TextFormField(
                            initialValue: edu.field,
                            decoration:
                                const InputDecoration(labelText: 'Field'),
                            onChanged: (value) {
                              edu.field = value;
                            },
                          ),
                        ),
                        isThreeLine: true,
                        leading: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            profileController.education.remove(edu);
                          },
                        ),
                      );
                    }).toList(),
                    ElevatedButton(
                      onPressed: () => _addEducationDialog(context),
                      child: const Text('Add Education'),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 16),

              // Save Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary),
                  onPressed: () {
                    // profileController
                    //     .saveProfile(); // Implement the save function
                    profileController.updateUserById();
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
                  profileController.skills.add(skillController.text);
                  // profileController.userProfile.update((val) {
                  //   val?.payload.skills.add(skillController.text);
                  // });
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

  Future<void> _selectDate(BuildContext context, DateTime? initialDate,
      Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  void _addExperienceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Experience'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: profileController.titleController,
                decoration: const InputDecoration(hintText: 'Job Title'),
              ),
              TextField(
                controller: profileController.companyController,
                decoration: const InputDecoration(hintText: 'Company'),
              ),
              TextField(
                controller: profileController.locationController,
                decoration: const InputDecoration(hintText: 'Location'),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        await _selectDate(
                            context, profileController.startDateXp.value,
                            (date) {
                          profileController.startDateXp.value = date;
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Obx(
                            () => Text(
                              profileController.startDateXp == null
                                  ? 'Start Date'
                                  : DateFormat('yyyy-MM-dd').format(
                                      profileController.startDateXp.value),
                              style: const TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        await _selectDate(
                            context, profileController.endDateXp.value, (date) {
                          profileController.endDateXp.value = date;
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Obx(
                            () => Text(
                              profileController.endDateXp == null
                                  ? 'End Date'
                                  : DateFormat('yyyy-MM-dd').format(
                                      profileController.endDateXp.value),
                              style: const TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (profileController.titleController.text.isNotEmpty &&
                    profileController.companyController.text.isNotEmpty &&
                    profileController.locationController.text.isNotEmpty &&
                    profileController.startDateXp != null &&
                    profileController.endDateXp != null) {
                  profileController.experience.add(
                    (
                      title: profileController.titleController.text,
                      company: profileController.companyController.text,
                      location: profileController.locationController.text,
                      startDate: profileController.startDateXp.value,
                      endDate: profileController.endDateXp.value,
                    ),
                  );
                  // profileController.userProfile.update((val) {
                  //   val?.payload.experience.add(
                  //     Experience(
                  //       title: profileController.titleController.text,
                  //       company: profileController.companyController.text,
                  //       location: profileController.locationController.text,
                  //       startDate: profileController.startDateXp.value,
                  //       endDate: profileController.endDateXp.value,
                  //     ),
                  //   );
                  // });
                  Get.back();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addEducationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Education'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: profileController.degreeController,
                decoration: const InputDecoration(hintText: 'Degree'),
              ),
              TextField(
                controller: profileController.schoolController,
                decoration: const InputDecoration(hintText: 'School'),
              ),
              TextField(
                controller: profileController.fieldController,
                decoration: const InputDecoration(hintText: 'Field'),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        await _selectDate(
                            context, profileController.startDateX.value,
                            (date) {
                          profileController.startDateX.value = date;
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Obx(
                            () => Text(
                              profileController.startDateX.value ==
                                      DateTime.now()
                                  ? 'Start Date'
                                  : DateFormat('yyyy-MM-dd').format(
                                      profileController.startDateX.value),
                              style: const TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        await _selectDate(
                            context, profileController.endDateX.value, (date) {
                          profileController.endDateX.value = date;
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Obx(
                            () => Text(
                              profileController.endDateX.value == DateTime.now()
                                  ? 'End Date'
                                  : DateFormat('yyyy-MM-dd')
                                      .format(profileController.endDateX.value),
                              style: const TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (profileController.degreeController.text.isNotEmpty &&
                    profileController.schoolController.text.isNotEmpty &&
                    profileController.fieldController.text.isNotEmpty &&
                    profileController.startDateX != null &&
                    profileController.endDateX != null) {
                  profileController.education.add(
                    (
                      degree: profileController.degreeController.text,
                      school: profileController.schoolController.text,
                      field: profileController.fieldController.text,
                      startDate: profileController.startDateX.value,
                      endDate: profileController.endDateX.value,
                    ),
                  );
                  // profileController.userProfile.update((val) {
                  //   val?.payload.education.add(
                  //     Education(
                  //       degree: profileController.degreeController.text,
                  //       school: profileController.schoolController.text,
                  //       field: profileController.fieldController.text,
                  //       startDate: profileController.startDateX.value,
                  //       endDate: profileController.endDateX.value,
                  //     ),
                  //   );
                  // });
                  Get.back();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
