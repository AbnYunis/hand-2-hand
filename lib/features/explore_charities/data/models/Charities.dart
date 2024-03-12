class Charities {
  final String message;
  final List<Charity> charities;

  Charities({
    required this.message,
    required this.charities,
  });

  factory Charities.fromJson(Map<String, dynamic> json) {
    return Charities(
      message: json['message'],
      charities:
          List<Charity>.from(json['charities'].map((x) => Charity.fromJson(x))),
    );
  }
}

class Charity {
  final String id;
  final String charityName;
  final String email;
  final String password;
  final List<String> phones;
  final bool isLoggedIn;
  final bool isConfirmEmail;
  final String role;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final dynamic otp;
  final String profilePic;

  Charity({
    required this.id,
    required this.charityName,
    required this.email,
    required this.password,
    required this.phones,
    required this.isLoggedIn,
    required this.isConfirmEmail,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.otp,
    required this.profilePic,
  });

  factory Charity.fromJson(Map<String, dynamic> json) {
    return Charity(
      id: json['_id'],
      charityName: json['charityName'],
      email: json['email'],
      password: json['password'],
      phones: List<String>.from(json['phones'].map((x) => x)),
      isLoggedIn: json['isLoggedIn'],
      isConfirmEmail: json['isConfirmEmail'],
      role: json['role'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
      otp: json['OTP'],
      profilePic:
          'https://thumbs.dreamstime.com/b/charity-word-cloud-heart-concept-56405290.jpg',
    );
  }
}
