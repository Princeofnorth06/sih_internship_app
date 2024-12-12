import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_internship_app/controllers/courses_controller.dart';
import 'package:sih_internship_app/helpers/cofig.dart';
import 'package:sih_internship_app/main.dart';
import 'package:sih_internship_app/models/courses_model.dart';
import 'package:sih_internship_app/models/job.dart';
import 'package:sih_internship_app/screens/jobs/jobs.dart';

class CourseDetailsScreen extends StatefulWidget {
  final String courseId;

  const CourseDetailsScreen({super.key, required this.courseId});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  Hub hub = Hub();
  sethub(CourseModel course) async {
    hub = await jobController.getHubById(course.hubId ?? "");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(CourseController()).getCourseById(widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    CourseController courseController = Get.put(CourseController());
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: FutureBuilder<CourseModel?>(
        future: courseController.getCourseById(widget.courseId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while fetching data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show an error message if something went wrong
            return const Center(child: Text('Error loading course details.'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            // Show a message if no data is returned
            return const Center(child: Text('Course not found.'));
          } else {
            // Data is available, display course details
            final course = snapshot.data!;
            sethub(course);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(
                      color: AppColors.background,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "by ${hub.name ?? "Unknown"}",
                    style: const TextStyle(
                      color: AppColors.background,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    //  borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      course.thumbnail,
                      width: mq.width * 0.93,
                      height: mq.height * 0.2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    course.description,
                    style: const TextStyle(
                      color: AppColors.background,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Playlist",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.background),
                  ),
                  
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
