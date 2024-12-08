class ApiRoutes {
  static const String serverUrl =
      'http://192.168.196.16:5000'; // Your server URL
  static const auth = "$serverUrl/api/v1/user";
  static const createUser = "$serverUrl/api/v1/user/create";
  static const getUserById = "$serverUrl/api/v1/user/id";
  static const edit = "$serverUrl/api/v1/user";
  static const getAllJobs = "$serverUrl/api/v1/hub/jobs";
}
