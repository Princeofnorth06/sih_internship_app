import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/componets/course_card.dart';
import 'package:sih_internship_app/controllers/courses_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/models/courses_model.dart';
import 'package:sih_internship_app/models/job.dart';
import 'package:sih_internship_app/screens/jobs/jobs.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  final courseController = Get.put(CourseController());
  Hub hub = Hub();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    courseController.getAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: const Text(
          'Courses',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
        ),
      ),
      body: Obx(() {
        if (courseController.courses.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: courseController.courses.length,
            itemBuilder: (context, index) {
              CourseModel course = courseController.courses[index];

              return CourseCard(course: course);
            },
          );
        }
      }),
    );
  }
}
