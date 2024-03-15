class DonationHistoryModel {
  final String message;
  final List<DonationItem> donations;

  DonationHistoryModel({
    required this.message,
    required this.donations,
  });

  factory DonationHistoryModel.fromJson(Map<String, dynamic> json) {
    return DonationHistoryModel(
      message: json['message'],
      donations: List<DonationItem>.from(
          json['donations'].map((x) => DonationItem.fromJson(x))),
    );
  }
}

class DonationItem {
  final String id;
  final String donationType;
  final int amount;
  final List<DonationImage> images;
  final String location;
  final String desc;
  final Charity? charity;
  final String createdBy;
  final String status;
  final String customId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  DonationItem({
    required this.id,
    required this.donationType,
    required this.amount,
    required this.images,
    required this.location,
    required this.desc,
    required this.charity,
    required this.createdBy,
    required this.status,
    required this.customId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory DonationItem.fromJson(Map<String, dynamic> json) {
    return DonationItem(
      id: json['_id'],
      donationType: json['donationType'],
      amount: json['amount'],
      images: List<DonationImage>.from(
          json['images'].map((x) => DonationImage.fromJson(x))),
      location: json['location'],
      desc: json['desc'],
      charity:
          json['charity'] != null ? Charity.fromJson(json['charity']) : null,
      createdBy: json['createdBy'],
      status: json['status'],
      customId: json['customId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'donationType': donationType,
      'amount': amount,
      'images': images.map((image) => image).toList(),
      'location': location,
      'desc': desc,
      'charity': charity,
      'createdBy': createdBy,
      'status': 'canceled',
      'customId': customId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class DonationImage {
  final String publicId;
  final String secureUrl;
  final String id;

  DonationImage({
    required this.publicId,
    required this.secureUrl,
    required this.id,
  });

  factory DonationImage.fromJson(Map<String, dynamic> json) {
    return DonationImage(
      publicId: json['public_id'],
      secureUrl: json['secure_url'],
      id: json['_id'],
    );
  }
}

class Charity {
  final String id;
  final String charityName;
  final List<String> phones;

  Charity({
    required this.id,
    required this.charityName,
    required this.phones,
  });

  factory Charity.fromJson(Map<String, dynamic> json) {
    return Charity(
      id: json['_id'],
      charityName: json['charityName'],
      phones: List<String>.from(json['phones'].map((x) => x)),
    );
  }

}
