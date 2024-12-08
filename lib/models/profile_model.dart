class UserModel {
  UserModel({
    required this.status,
    required this.payload,
  });
  late final String status;
  late final Payload payload;

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    payload = Payload.fromJson(json['payload']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['payload'] = payload.toJson();
    return _data;
  }
}

class Payload {
  Payload({
    required this.id,
    required this.uid,
    required this.email,
    required this.isPaid,
    required this.bannerImageURL,
    required this.userImageURL,
    required this.userName,
    required this.address,
    required this.subString,
    this.dob,
    required this.about,
    required this.portfolio,
    required this.github,
    required this.linkedIn,
    required this.phone,
    required this.skills,
    required this.jobsApplied,
    required this.experience,
    required this.education,
    required this.achivement,
    required this.project,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String uid;
  late final String email;
  late final bool isPaid;
  late final String bannerImageURL;
  late final String userImageURL;
  late final String userName;
  late final String address;
  late final String subString;
  late String? dob;
  late final String about;
  late final String portfolio;
  late final String github;
  late final String linkedIn;
  late final String phone;
  late final List<dynamic> skills;
  late final List<dynamic> jobsApplied;
  late final List<dynamic> experience;
  late final List<dynamic> education;
  late final List<dynamic> achivement;
  late final List<dynamic> project;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    uid = json['uid'];
    email = json['email'];
    isPaid = json['isPaid'];
    bannerImageURL = json['bannerImageURL'];
    userImageURL = json['userImageURL'];
    userName = json['userName'];
    address = json['address'];
    subString = json['subString'];
    dob = json['dob'];
    about = json['about'];
    portfolio = json['portfolio'];
    github = json['github'];
    linkedIn = json['linkedIn'];
    phone = json['phone'];
    skills = List.castFrom<dynamic, dynamic>(json['skills']);
    jobsApplied = List.castFrom<dynamic, dynamic>(json['jobsApplied']);
    experience = List.castFrom<dynamic, dynamic>(json['experience']);
    education = List.castFrom<dynamic, dynamic>(json['education']);
    achivement = List.castFrom<dynamic, dynamic>(json['achivement']);
    project = List.castFrom<dynamic, dynamic>(json['project']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['uid'] = uid;
    _data['email'] = email;
    _data['isPaid'] = isPaid;
    _data['bannerImageURL'] = bannerImageURL;
    _data['userImageURL'] = userImageURL;
    _data['userName'] = userName;
    _data['address'] = address;
    _data['subString'] = subString;
    _data['dob'] = dob;
    _data['about'] = about;
    _data['portfolio'] = portfolio;
    _data['github'] = github;
    _data['linkedIn'] = linkedIn;
    _data['phone'] = phone;
    _data['skills'] = skills;
    _data['jobsApplied'] = jobsApplied;
    _data['experience'] = experience;
    _data['education'] = education;
    _data['achivement'] = achivement;
    _data['project'] = project;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}
