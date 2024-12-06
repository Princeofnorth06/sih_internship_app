class ApiRoutes {
  static const String serverUrl =
      'http://172.16.235.136:5000'; // Your server URL
  static const auth = "$serverUrl/api/v1/user";
  static const createUser = "$serverUrl/api/v1/user/create";
  static const getUserById = "$serverUrl/api/v1/user/getUserById";
}
