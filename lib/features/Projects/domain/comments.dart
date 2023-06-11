class Comments {
  int id;
  String comment;
  String userName;
  int community;
  String communityColor;
  String communityLabel;
  Null picture;
  String updatedAt;
  String createdAt;
  List<Replies> replies;

  Comments(
      {this.id,
      this.comment,
      this.userName,
      this.community,
      this.communityColor,
      this.communityLabel,
      this.picture,
      this.updatedAt,
      this.createdAt,
      this.replies});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    userName = json['user_name'];
    community = json['community'];
    communityColor = json['community_color'];
    communityLabel = json['community_label'];
    picture = json['picture'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    if (json['replies'] != null) {
      replies = <Replies>[];
      json['replies'].forEach((v) {
        replies.add(new Replies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['user_name'] = this.userName;
    data['community'] = this.community;
    data['community_color'] = this.communityColor;
    data['community_label'] = this.communityLabel;
    data['picture'] = this.picture;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    if (this.replies != null) {
      data['replies'] = this.replies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Replies {
  int id;
  String comment;
  String userName;
  int community;
  String communityColor;
  String communityLabel;
  Null picture;
  String updatedAt;
  String createdAt;

  Replies({
    this.id,
    this.comment,
    this.userName,
    this.community,
    this.communityColor,
    this.communityLabel,
    this.picture,
    this.updatedAt,
    this.createdAt,
  });

  Replies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    userName = json['user_name'];
    community = json['community'];
    communityColor = json['community_color'];
    communityLabel = json['community_label'];
    picture = json['picture'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['user_name'] = this.userName;
    data['community'] = this.community;
    data['community_color'] = this.communityColor;
    data['community_label'] = this.communityLabel;
    data['picture'] = this.picture;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;

    return data;
  }
}
