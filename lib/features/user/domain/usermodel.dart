class Usermodel {
  String token;
  String bio;
  String name;
  String phone;
  String phoneCode;
  String address;
  int community;
  String communityColor;
  String communityLabel;
  String jobTitle;
  String email;
  String availableCapital;
  String availableCapitalKey;
  int pictureId;
  String username;
  int status;
  String statusLabel;
  String statusColorClass;
  int approvalStatus;
  String approvalStatusLabel;
  String approvalStatusColorClass;
  String updatedAt;
  String createdAt;
  int id;
  String facebook;
  String linkedIn;
  String twitter;
  String instagram;
  String picture;

  Usermodel(
      {this.token,
      this.bio,
      this.name,
      this.phone,
      this.phoneCode,
      this.address,
      this.community,
      this.communityColor,
      this.communityLabel,
      this.jobTitle,
      this.email,
      this.availableCapital,
      this.availableCapitalKey,
      this.pictureId,
      this.username,
      this.status,
      this.statusLabel,
      this.statusColorClass,
      this.approvalStatus,
      this.approvalStatusLabel,
      this.approvalStatusColorClass,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.facebook,
      this.linkedIn,
      this.twitter,
      this.instagram,
      this.picture});

  Usermodel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    bio = json['bio'];
    name = json['name'];
    phone = json['phone'];
    phoneCode = json['phone_code'];
    address = json['address'];
    community = json['community'];
    communityColor = json['community_color'];
    communityLabel = json['community_label'];
    jobTitle = json['job_title'];
    email = json['email'];
    availableCapital = json['available_capital'];
    availableCapitalKey = json['available_capital_key'];
    pictureId = json['picture_id'];
    username = json['username'];
    status = json['status'];
    statusLabel = json['status_label'];
    statusColorClass = json['status_color_class'];
    approvalStatus = json['approval_status'];
    approvalStatusLabel = json['approval_status_label'];
    approvalStatusColorClass = json['approval_status_color_class'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    facebook = json['facebook'];
    linkedIn = json['linked_in'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['bio'] = this.bio;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['phone_code'] = this.phoneCode;
    data['address'] = this.address;
    data['community'] = this.community;
    data['community_color'] = this.communityColor;
    data['community_label'] = this.communityLabel;
    data['job_title'] = this.jobTitle;
    data['email'] = this.email;
    data['available_capital'] = this.availableCapital;
    data['available_capital_key'] = this.availableCapitalKey;
    data['picture_id'] = this.pictureId;
    data['username'] = this.username;
    data['status'] = this.status;
    data['status_label'] = this.statusLabel;
    data['status_color_class'] = this.statusColorClass;
    data['approval_status'] = this.approvalStatus;
    data['approval_status_label'] = this.approvalStatusLabel;
    data['approval_status_color_class'] = this.approvalStatusColorClass;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['facebook'] = this.facebook;
    data['linked_in'] = this.linkedIn;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['picture'] = this.picture;
    return data;
  }
}
