class JobResponse {
  String? message;
  List<Job>? jobs;

  JobResponse({this.message, this.jobs});

  JobResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['jobs'] != null) {
      jobs = <Job>[];
      json['jobs'].forEach((v) {
        jobs!.add(Job.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (jobs != null) {
      data['jobs'] = jobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Job {
  String? id;
  String? title;
  Hub? hub;
  String? description;
  List<String>? skills;
  List<String>? requirements;
  String? location;
  int? salaryStart;
  int? salaryEnd;
  String? type;
  String? workMode;
  String? hiringStartDate;
  String? hiringEndDate;
  int? numberOfOpenings;
  List<HrContact>? hrContact;
  List<Application>? application;
  List<dynamic>? mentoringSessions;
  String? createdAt;
  String? updatedAt;
  int? v;

  Job({
    this.id,
    this.title,
    this.hub,
    this.description,
    this.skills,
    this.requirements,
    this.location,
    this.salaryStart,
    this.salaryEnd,
    this.type,
    this.workMode,
    this.hiringStartDate,
    this.hiringEndDate,
    this.numberOfOpenings,
    this.hrContact,
    this.application,
    this.mentoringSessions,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Job.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    hub = json['hub'] != null ? Hub.fromJson(json['hub']) : null;
    description = json['description'];
    skills = json['skills'].cast<String>();
    requirements = json['requirements'].cast<String>();
    location = json['location'];
    salaryStart = json['salaryStart'];
    salaryEnd = json['salaryEnd'];
    type = json['type'];
    workMode = json['workMode'];
    hiringStartDate = json['hiringStartDate'];
    hiringEndDate = json['hiringEndDate'];
    numberOfOpenings = json['numberOfOpenings'];
    if (json['hrContact'] != null) {
      hrContact = <HrContact>[];
      json['hrContact'].forEach((v) {
        hrContact!.add(HrContact.fromJson(v));
      });
    }
    if (json['application'] != null) {
      application = <Application>[];
      json['application'].forEach((v) {
        application!.add(Application.fromJson(v));
      });
    }
    mentoringSessions = json['mentoringSessions'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    if (hub != null) {
      data['hub'] = hub!.toJson();
    }
    data['description'] = description;
    data['skills'] = skills;
    data['requirements'] = requirements;
    data['location'] = location;
    data['salaryStart'] = salaryStart;
    data['salaryEnd'] = salaryEnd;
    data['type'] = type;
    data['workMode'] = workMode;
    data['hiringStartDate'] = hiringStartDate;
    data['hiringEndDate'] = hiringEndDate;
    data['numberOfOpenings'] = numberOfOpenings;
    if (hrContact != null) {
      data['hrContact'] = hrContact!.map((v) => v.toJson()).toList();
    }
    if (application != null) {
      data['application'] = application!.map((v) => v.toJson()).toList();
    }
    data['mentoringSessions'] = mentoringSessions;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}

class Hub {
  String? id;
  String? email;
  String? name;
  String? status;
  String? website;
  String? instagramId;
  String? facebookId;
  String? contact;
  String? description;
  String? location;
  String? logo;
  String? domain;
  String? foundingDate;
  String? teamSize;
  int? hiredFromUs;
  List<String>? jobs;
  List<dynamic>? mentoringSessions;
  String? createdAt;
  String? updatedAt;
  int? v;

  Hub({
    this.id,
    this.email,
    this.name,
    this.status,
    this.website,
    this.instagramId,
    this.facebookId,
    this.contact,
    this.description,
    this.location,
    this.logo,
    this.domain,
    this.foundingDate,
    this.teamSize,
    this.hiredFromUs,
    this.jobs,
    this.mentoringSessions,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Hub.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    name = json['name'];
    status = json['status'];
    website = json['website'];
    instagramId = json['instagramId'];
    facebookId = json['facebookId'];
    contact = json['contact'];
    description = json['description'];
    location = json['location'];
    logo = json['logo'];
    domain = json['domain'];
    foundingDate = json['foundingDate'];
    teamSize = json['teamSize'];
    hiredFromUs = json['hiredFromUs'];
    jobs = json['jobs'].cast<String>();
    mentoringSessions = json['mentoringSessions'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['status'] = status;
    data['website'] = website;
    data['instagramId'] = instagramId;
    data['facebookId'] = facebookId;
    data['contact'] = contact;
    data['description'] = description;
    data['location'] = location;
    data['logo'] = logo;
    data['domain'] = domain;
    data['foundingDate'] = foundingDate;
    data['teamSize'] = teamSize;
    data['hiredFromUs'] = hiredFromUs;
    data['jobs'] = jobs;
    data['mentoringSessions'] = mentoringSessions;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}

class HrContact {
  String? name;
  String? email;
  String? id;

  HrContact({this.name, this.email, this.id});

  HrContact.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['_id'] = id;
    return data;
  }
}

class Application {
  String? id;
  String? date;
  String? status;
  String? appId;

  Application({this.id, this.date, this.status, this.appId});

  Application.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    status = json['status'];
    appId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['status'] = status;
    data['_id'] = appId;
    return data;
  }
}
