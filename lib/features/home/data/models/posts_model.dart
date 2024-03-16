
class PostsModel {
  String message;
  List<Post> posts;

  PostsModel({
    required this.message,
    required this.posts,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
    message: json["message"],
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
  };
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

  Map<String, dynamic> toJson() => {
    "image": image.toJson(),
    "_id": id,
    "title": title,
    "desc": desc,
    "createdBy": createdBy.toJson(),
    "location": location,
    "volunteers": List<dynamic>.from(volunteers.map((x) => x)),
    "customId": customId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class CreatedBy {
  String id;
  String charityName;
  String email;
  List<String> phones;
  String status;
  String createdById;

  CreatedBy({
    required this.id,
    required this.charityName,
    required this.email,
    required this.phones,
    required this.status,
    required this.createdById,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["_id"],
    charityName: json["charityName"],
    email: json["email"],
    phones: List<String>.from(json["phones"].map((x) => x)),
    status: json["status"],
    createdById: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "charityName": charityName,
    "email": email,
    "phones": List<dynamic>.from(phones.map((x) => x)),
    "status": status,
    "id": createdById,
  };
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

  Map<String, dynamic> toJson() => {
    "secure_url": secureUrl,
    "public_id": publicId,
  };
}
