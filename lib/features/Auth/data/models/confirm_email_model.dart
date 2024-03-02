class ConfirmEmailModel {
  String message;
  User user;

  ConfirmEmailModel({
    required this.message,
    required this.user,
  });

  factory ConfirmEmailModel.fromJson(Map<String, dynamic> json) => ConfirmEmailModel(
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

}

class User {
  String id;
  String userName;
  String email;
  String password;
  String phone;
  bool isLoggedIn;
  bool isConfirmEmail;
  String role;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  dynamic otp;
  String userId;

  User({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.phone,
    required this.isLoggedIn,
    required this.isConfirmEmail,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.otp,
    required this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    userName: json["userName"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    isLoggedIn: json["isLoggedIn"],
    isConfirmEmail: json["isConfirmEmail"],
    role: json["role"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    otp: json["OTP"],
    userId: json["id"],
  );

}
