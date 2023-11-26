class ApplyedJops {
  bool? status;
  List<ApplyedJopsData>? data;

  ApplyedJops({this.status, this.data});

  ApplyedJops.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ApplyedJopsData>[];
      json['data'].forEach((v) {
        data!.add(new ApplyedJopsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApplyedJopsData {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? workType;
  String? cvFile;
  String? otherFile;
  int? jobsId;
  int? userId;
  int? reviewed;
  String? createdAt;
  String? updatedAt;

  ApplyedJopsData(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.workType,
      this.cvFile,
      this.otherFile,
      this.jobsId,
      this.userId,
      this.reviewed,
      this.createdAt,
      this.updatedAt});

  ApplyedJopsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    workType = json['work_type'];
    cvFile = json['cv_file'];
    otherFile = json['other_file'];
    jobsId = json['jobs_id'];
    userId = json['user_id'];
    reviewed = json['reviewed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['work_type'] = this.workType;
    data['cv_file'] = this.cvFile;
    data['other_file'] = this.otherFile;
    data['jobs_id'] = this.jobsId;
    data['user_id'] = this.userId;
    data['reviewed'] = this.reviewed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
