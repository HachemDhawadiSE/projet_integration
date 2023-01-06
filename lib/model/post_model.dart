List<PostModel> postFromJson(dynamic str) =>
    List<PostModel>.from((str).map((x) => PostModel.fromJson(x)));

class PostModel {
  late String? id;
  late String? postTitle;
  late String? postDescription;
  late String? postImage;

  PostModel({
    this.id,
    this.postTitle,
    this.postDescription,
    this.postImage,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    postTitle = json["postTitle"];
    postDescription = json["postDescription"];
    postImage = json["postImage"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data["_id"] = id;
    _data["postTitle"] = postTitle!;
    _data["postDescription"] = postDescription!;
    _data["postImage"] = postImage;

    return _data;
  }
}
