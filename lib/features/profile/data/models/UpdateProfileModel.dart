class UpdateProfileModel {
  String message;
  User user;

  UpdateProfileModel({
    required this.message,
    required this.user,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
  };
}

class User {
  String userName;
  String email;
  String password;
  String phone;
  bool isLoggedIn;
  bool isConfirmEmail;
  String role;
  String status;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? otp;
  String userId;
  String? secureUrl;

  User(
      {required this.userName,
        required this.email,
        required this.password,
        required this.phone,
        required this.isLoggedIn,
        required this.isConfirmEmail,
        required this.role,
        required this.status,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        this.otp,
        required this.userId,
        this.secureUrl});

  factory User.fromJson(Map<String, dynamic> json) => User(
    userName: json["userName"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    isLoggedIn: json["isLoggedIn"],
    isConfirmEmail: json["isConfirmEmail"],
    role: json["role"],
    status: json["status"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    otp: json["OTP"] ?? '12345',
    userId: json["id"],
    secureUrl: json['profile_pic']['secure_url'] ??
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh1MxDvWeEQ39D04ETGLuJ_pnSkd_gZf47R7qkQaxbHotxVs-aBvYjsHmbvxcKhTGn9gI&usqp=CAU',
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "email": email,
    "password": password,
    "phone": phone,
    "isLoggedIn": isLoggedIn,
    "isConfirmEmail": isConfirmEmail,
    "role": role,
    "status": status,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "OTP": otp ?? '123456',
    "id": userId,
  };
}
