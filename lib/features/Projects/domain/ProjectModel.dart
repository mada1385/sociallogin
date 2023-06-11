import 'package:social_login/features/user/domain/usermodel.dart';

class Project {
  int id;
  bool isFav;
  String title;
  int totalCapital;
  int requestedCapital;
  int annualExpectedRevenue;
  int totalExpectedRevenue;
  int type;
  String typeLabel;
  int partnerRequiredNumber;
  int partnerJoinedNumber;
  int investmentFieldId;
  String investmentField;
  int community;
  String communityColor;
  String communityLabel;
  int status;
  String statusLabel;
  String statusColorClass;
  int approvalStatus;
  String approvalStatusLabel;
  String approvalStatusColorClass;
  int progressStatus;
  String progressStatusLabel;
  String progressStatusColorClass;
  int projectStage;
  String projectStageLabel;
  String details;
  int userId;
  int approvalId;
  Usermodel user;
  List<String> approval;
  String updatedAt;
  String createdAt;

  Project(
      {this.id,
      this.title,
      this.totalCapital,
      this.requestedCapital,
      this.annualExpectedRevenue,
      this.totalExpectedRevenue,
      this.type,
      this.typeLabel,
      this.partnerRequiredNumber,
      this.partnerJoinedNumber,
      this.investmentFieldId,
      this.investmentField,
      this.community,
      this.communityColor,
      this.communityLabel,
      this.status,
      this.statusLabel,
      this.statusColorClass,
      this.approvalStatus,
      this.approvalStatusLabel,
      this.approvalStatusColorClass,
      this.progressStatus,
      this.progressStatusLabel,
      this.progressStatusColorClass,
      this.projectStage,
      this.projectStageLabel,
      this.details,
      this.userId,
      this.approvalId,
      this.user,
      this.approval,
      this.updatedAt,
      this.createdAt});

  Project.fromJson(Map<String, dynamic> json) {
    isFav = json["is_fav"];
    id = json['id'];
    title = json['title'] ?? " ";
    totalCapital = json['total_capital'] ?? 0;
    requestedCapital = json['requested_capital'] ?? 0;
    annualExpectedRevenue = json['annual_expected_revenue'] ?? 0;
    totalExpectedRevenue = json['total_expected_revenue'] ?? 0;
    type = json['type'] ?? 0;
    typeLabel = json['type_label'];
    partnerRequiredNumber = json['partner_required_number'];
    partnerJoinedNumber = json['partner_joined_number'];
    investmentFieldId = json['investment_field_id'];
    investmentField = json['investment_field'];
    community = json['community'];
    communityColor = json['community_color'];
    communityLabel = json['community_label'];
    status = json['status'];
    statusLabel = json['status_label'];
    statusColorClass = json['status_color_class'];
    approvalStatus = json['approval_status'];
    approvalStatusLabel = json['approval_status_label'];
    approvalStatusColorClass = json['approval_status_color_class'];
    progressStatus = json['progress_status'];
    progressStatusLabel = json['progress_status_label'];
    progressStatusColorClass = json['progress_status_color_class'];
    projectStage = json['project_stage'];
    projectStageLabel = json['project_stage_label'];
    details = json['details'];
    userId = json['user_id'];
    approvalId = json['approval_id'];
    user = json['user'] != null ? new Usermodel.fromJson(json['user']) : null;
    if (json['approval'] != null) {
      approval = <Null>[];
      json['approval'].forEach((v) {
        approval.add(v);
      });
    }
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['total_capital'] = this.totalCapital;
    data['requested_capital'] = this.requestedCapital;
    data['annual_expected_revenue'] = this.annualExpectedRevenue;
    data['total_expected_revenue'] = this.totalExpectedRevenue;
    data['type'] = this.type;
    data['type_label'] = this.typeLabel;
    data['partner_required_number'] = this.partnerRequiredNumber;
    data['partner_joined_number'] = this.partnerJoinedNumber;
    data['investment_field_id'] = this.investmentFieldId;
    data['investment_field'] = this.investmentField;
    data['community'] = this.community;
    data['community_color'] = this.communityColor;
    data['community_label'] = this.communityLabel;
    data['status'] = this.status;
    data['status_label'] = this.statusLabel;
    data['status_color_class'] = this.statusColorClass;
    data['approval_status'] = this.approvalStatus;
    data['approval_status_label'] = this.approvalStatusLabel;
    data['approval_status_color_class'] = this.approvalStatusColorClass;
    data['progress_status'] = this.progressStatus;
    data['progress_status_label'] = this.progressStatusLabel;
    data['progress_status_color_class'] = this.progressStatusColorClass;
    data['project_stage'] = this.projectStage;
    data['project_stage_label'] = this.projectStageLabel;
    data['details'] = this.details;
    data['user_id'] = this.userId;
    data['approval_id'] = this.approvalId;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.approval != null) {
      data['approval'] = this.approval.map((v) => v).toList();
    }
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
