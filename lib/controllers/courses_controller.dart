import 'package:get/get.dart';
import 'package:sih_internship_app/models/courses_model.dart';
import 'package:sih_internship_app/reopos/courses_repo.dart';

class CourseController extends GetxController {
  final courses = <CourseModel>[].obs;

  Future<void> getAllCourses() async {
    try {
      final newCourses = await CoursesRepo().getAllCourses();
      courses.assignAll(newCourses);
    } catch (e) {
      // Handle errors, e.g., display a snackbar to the user
      print('Error fetching courses: $e');
      Get.snackbar('Error', 'Failed to load courses.');
    }
  }

  Future<CourseModel?> getCourseById(String id) async {
    try {
      // Fetch course from the repository
      final course = await CoursesRepo().getCoarseById(id);
      return course;
    } catch (e) {
      print('Error fetching courses: $e');
      Get.snackbar('Error', 'Failed to load course details.');
      return null; // Return null if something goes wrong
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllCourses();
  }
}
