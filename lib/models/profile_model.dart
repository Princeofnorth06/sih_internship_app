class UserProfile {
  String uid;
  String email;
  bool isPaid;
  ProfileData profileData;

  UserProfile({
    required this.uid,
    required this.email,
    required this.isPaid,
    required this.profileData,
  });
}

class ProfileData {
  String name;
  String profileImage;
  String profileImagebackground;
  String address;
  DateTime dob;
  String role;
  ContactInfo contactInfo;
  String about;
  List<String> skills;
  List<Experience> experiences;
  List<Education> education;

  ProfileData({
    required this.name,
    required this.profileImage,
    required this.profileImagebackground,
    required this.address,
    required this.dob,
    required this.role,
    required this.contactInfo,
    required this.about,
    required this.skills,
    required this.experiences,
    required this.education,
  });
}

class ContactInfo {
  String phone;
  String email;
  String portfolio;
  String linkedIn;
  String github;
  String twitter;
  String instagram;
  String youtube;
  String kaggle;
  String whatsapp;

  ContactInfo({
    required this.phone,
    required this.email,
    required this.portfolio,
    required this.linkedIn,
    required this.github,
    required this.twitter,
    required this.instagram,
    required this.youtube,
    required this.kaggle,
    required this.whatsapp,
  });
}

class Experience {
  String title;
  String company;
  String location;
  DateTime startDate;
  DateTime? endDate;
  String description;

  Experience({
    required this.title,
    required this.company,
    required this.location,
    required this.startDate,
    this.endDate,
    required this.description,
  });
}

class Education {
  String degree;
  String school;
  String feild;
  DateTime startDate;
  DateTime? endDate;
  String description;

  Education({
    required this.degree,
    required this.school,
    required this.feild,
    required this.startDate,
    this.endDate,
    required this.description,
  });
}
