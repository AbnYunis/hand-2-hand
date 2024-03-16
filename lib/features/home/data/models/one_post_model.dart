class OnePostModel {
  String message;
  Post post;

  OnePostModel({
    required this.message,
    required this.post,
  });

  factory OnePostModel.fromJson(Map<String, dynamic> json) => OnePostModel(
        message: json["message"],
        post: Post.fromJson(json["post"]),
      );
}

class Post {
  Image image;
  String id;
  String title;
  String desc;
  CreatedBy createdBy;
  String location;
  List<dynamic> volunteers;
  String customId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Post({
    required this.image,
    required this.id,
    required this.title,
    required this.desc,
    required this.createdBy,
    required this.location,
    required this.volunteers,
    required this.customId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        image: Image.fromJson(json["image"]),
        id: json["_id"],
        title: json["title"],
        desc: json["desc"],
        createdBy: CreatedBy.fromJson(json["createdBy"]),
        location: json["location"],
        volunteers: List<dynamic>.from(json["volunteers"].map((x) => x)),
        customId: json["customId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class CreatedBy {
  String id;
  String charityName;
  String email;
  List<String> phones;
  String createdById;

  CreatedBy({
    required this.id,
    required this.charityName,
    required this.email,
    required this.phones,
    required this.createdById,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["_id"],
        charityName: json["charityName"],
        email: json["email"],
        phones: List<String>.from(json["phones"].map((x) => x)),
        createdById: json["id"],
      );
}

class Image {
  String secureUrl;
  String publicId;

  Image({
    required this.secureUrl,
    required this.publicId,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        secureUrl: json["secure_url"],
        publicId: json["public_id"],
      );
}
