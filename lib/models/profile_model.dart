class UserModel {
  String uid;
  String email;
  bool isPaid;
  String bannerImageURL;
  String userImageURL;
  List<JobApplied> jobsApplied;
  String userName;
  String address;
  String subString;
  DateTime? dob;
  String about;
  String portfolio;
  String github;
  String linkedIn;
  String phone;
  List<String> skills;
  List<dynamic> experience;
  List<dynamic> education;
  List<dynamic> achievements;
  List<dynamic> projects;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    required this.uid,
    required this.email,
    this.isPaid = false,
    this.bannerImageURL = '',
    required this.userImageURL,
    this.jobsApplied = const [],
    this.userName = '',
    this.address = '',
    this.subString = '',
    this.dob,
    this.about = '',
    this.portfolio = '',
    this.github = '',
    this.linkedIn = '',
    this.phone = '',
    this.skills = const [],
    this.experience = const [],
    this.education = const [],
    this.achievements = const [],
    this.projects = const [],
    this.createdAt,
    this.updatedAt,
  });

  // Method to convert UserModel from JSON (e.g., from API response)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      isPaid: json['isPaid'] ?? false,
      bannerImageURL: json['bannerImageURL'] ?? '',
      userImageURL: json['userImageURL'] ?? '',
      jobsApplied: (json['jobsApplied'] as List)
          .map((item) => JobApplied.fromJson(item))
          .toList(),
      userName: json['userName'] ?? '',
      address: json['address'] ?? '',
      subString: json['subString'] ?? '',
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      about: json['about'] ?? '',
      portfolio: json['portfolio'] ?? '',
      github: json['github'] ?? '',
      linkedIn: json['linkedIn'] ?? '',
      phone: json['phone'] ?? '',
      skills: List<String>.from(json['skills'] ?? []),
      experience: json['experience'] ?? [],
      education: json['education'] ?? [],
      achievements: json['achievements'] ?? [],
      projects: json['projects'] ?? [],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  // Method to convert UserModel to JSON (e.g., for API requests)
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'isPaid': isPaid,
      'bannerImageURL': bannerImageURL,
      'userImageURL': userImageURL,
      'jobsApplied': jobsApplied.map((job) => job.toJson()).toList(),
      'userName': userName,
      'address': address,
      'subString': subString,
      'dob': dob?.toIso8601String(),
      'about': about,
      'portfolio': portfolio,
      'github': github,
      'linkedIn': linkedIn,
      'phone': phone,
      'skills': skills,
      'experience': experience,
      'education': education,
      'achievements': achievements,
      'projects': projects,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

// JobApplied class for 'jobsApplied' field
class JobApplied {
  String id;
  String date;

  JobApplied({
    required this.id,
    required this.date,
  });

  factory JobApplied.fromJson(Map<String, dynamic> json) {
    return JobApplied(
      id: json['id'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
    };
  }
}
