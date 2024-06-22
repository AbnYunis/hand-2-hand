class PostsModel {
  String? message;
  List<Posts>? posts;

  PostsModel({message, posts});

  PostsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  Image? image;
  String? sId;
  String? title;
  String? desc;
  CreatedBy? createdBy;
  String? location;
  List<String>? volunteers;
  String? customId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Posts(
      {image,
      sId,
      title,
      desc,
      createdBy,
      location,
      volunteers,
      customId,
      createdAt,
      updatedAt,
      iV});

  Posts.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null
        ? Image.fromJson(json['image'])
        : Image.fromJson({
            "secure_url":
                "https://res.cloudinary.com/dijwhgmfh/image/upload/v1710202077/Charities/Charities/Posts/ANl_lLrKe2DzjGqOBRYXV/iysj6pmihhghojlcgw3l.png",
            "public_id":
                "Charities/Charities/Posts/ANl_lLrKe2DzjGqOBRYXV/iysj6pmihhghojlcgw3l"
          });
    sId = json['_id'];
    title = json['title'];
    desc = json['desc'];
    createdBy = json['createdBy'] != null
        ? CreatedBy.fromJson(json['createdBy'])
        : null;
    location = json['location'];
    volunteers = json['volunteers'].cast<String>();
    customId = json['customId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['_id'] = sId;
    data['title'] = title;
    data['desc'] = desc;
    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }
    data['location'] = location;
    data['volunteers'] = volunteers;
    data['customId'] = customId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Image {
  String? secureUrl;
  String? publicId;

  Image({secureUrl, publicId});

  Image.fromJson(Map<String, dynamic> json) {
    secureUrl = json['secure_url'];
    publicId = json['public_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['secure_url'] = secureUrl;
    data['public_id'] = publicId;
    return data;
  }
}

class CreatedBy {
  String? sId;
  String? charityName;
  String? email;
  List<String>? phones;
  String? status;
  String? id;

  CreatedBy({sId, charityName, email, phones, status, id});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    charityName = json['charityName'];
    email = json['email'];
    phones = json['phones'].cast<String>();
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['charityName'] = charityName;
    data['email'] = email;
    data['phones'] = phones;
    data['status'] = status;
    data['id'] = id;
    return data;
  }
}
