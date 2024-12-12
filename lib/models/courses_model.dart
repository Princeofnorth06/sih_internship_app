class CourseModel {
  String id;
  String title;
  String description;
  String thumbnail;
  List<dynamic> userStatus;
  String? hubId;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.userStatus,
    this.hubId,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      userStatus: List.from(json['userStatus']),
      hubId: json['hubId'],
    );
  }
}

List<CourseModel> coursesFromJson(List<dynamic> json) {
  return json.map((courseJson) => CourseModel.fromJson(courseJson)).toList();
}
