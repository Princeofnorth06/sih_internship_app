class ApiRoutes {
  static const String serverUrl =
      'http://192.168.196.16:5000'; // Your server URL
  static const auth = "$serverUrl/api/v1/user";
  static const createUser = "$serverUrl/api/v1/user/create";
  static const getUserById = "$serverUrl/api/v1/user/id";
  static const edit = "$serverUrl/api/v1/user";
  static const getAllJobs = "$serverUrl/api/v1/hub/jobs";
  static const getAllJobById = "$serverUrl/api/v1/hub/job";
  static const getHubById = "$serverUrl/api/v1/hub/id";
  static const getAllCourses = "$serverUrl/api/v1/course/courses";
  static const getVideosById = "$serverUrl/api/v1/course/video";
  static const getCourseById = "$serverUrl/api/v1/course/";
}
