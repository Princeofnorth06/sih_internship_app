class VideoResponse {
  final String message;
  final List<Video> videos;

  VideoResponse({required this.message, required this.videos});

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    return VideoResponse(
      message: json['message'],
      videos: List<Video>.from(
          json['videos'].map((videoJson) => Video.fromJson(videoJson))),
    );
  }
}

class Video {
  final String id;
  final String title;
  final String description;
  final String courseId;
  final String link;
  final int videoNo;
  final DateTime createdAt;
  final DateTime updatedAt;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.courseId,
    required this.link,
    required this.videoNo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      courseId: json['courseId'],
      link: json['link'],
      videoNo: json['videoNo'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
