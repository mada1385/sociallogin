import 'package:social_login/features/user/domain/usermodel.dart';

class POLL {
  int id;
  int votedId;
  String question;
  int canComment;
  String expireDate;
  int community;
  String communityColor;
  String communityLabel;
  int progressStatuses;
  String progressStatusesLabel;
  String progressStatusesColor;
  int userId;
  Usermodel user;
  List<Answers> answers;
  int investmentFieldId;
  String investmentFieldLabel;
  String updatedAt;
  String createdAt;

  POLL(
      {this.id,
      this.votedId,
      this.question,
      this.canComment,
      this.expireDate,
      this.community,
      this.communityColor,
      this.communityLabel,
      this.progressStatuses,
      this.progressStatusesLabel,
      this.progressStatusesColor,
      this.userId,
      this.user,
      this.answers,
      this.investmentFieldId,
      this.investmentFieldLabel,
      this.updatedAt,
      this.createdAt});

  POLL.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    votedId = json['voted_id'];
    question = json['question'];
    canComment = json['can_comment'];
    expireDate = json['expire_date'];
    community = json['community'];
    communityColor = json['community_color'];
    communityLabel = json['community_label'];
    progressStatuses = json['progress_statuses'];
    progressStatusesLabel = json['progress_statuses_label'];
    progressStatusesColor = json['progress_statuses_color'];
    userId = json['user_id'];
    user = json['user'] != null ? new Usermodel.fromJson(json['user']) : null;
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers.add(new Answers.fromJson(v));
      });
    }
    investmentFieldId = json['investment_field_id'];
    investmentFieldLabel = json['investment_field_label'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['voted_id'] = this.votedId;
    data['question'] = this.question;
    data['can_comment'] = this.canComment;
    data['expire_date'] = this.expireDate;
    data['community'] = this.community;
    data['community_color'] = this.communityColor;
    data['community_label'] = this.communityLabel;
    data['progress_statuses'] = this.progressStatuses;
    data['progress_statuses_label'] = this.progressStatusesLabel;
    data['progress_statuses_color'] = this.progressStatusesColor;
    data['user_id'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    data['investment_field_id'] = this.investmentFieldId;
    data['investment_field_label'] = this.investmentFieldLabel;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Answers {
  int id;
  String answer;
  num percent;
  int votesCount;

  Answers({this.id, this.answer, this.percent, this.votesCount});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
    percent = json['percent'];
    votesCount = json['votes_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['answer'] = this.answer;
    data['percent'] = this.percent;
    data['votes_count'] = this.votesCount;
    return data;
  }
}
