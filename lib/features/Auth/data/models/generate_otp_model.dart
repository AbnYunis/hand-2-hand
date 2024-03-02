class GenerateOtp {
  String message;
  String userId;

  GenerateOtp({
    required this.message,
    required this.userId,
  });

  factory GenerateOtp.fromJson(Map<String, dynamic> json) => GenerateOtp(
    message: json["message"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "userId": userId,
  };
}
