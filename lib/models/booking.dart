class Booking {
  final String id;
  final String marketDayId;
  final String memberName;
  final String phone;
  final int stallNumber;
  final DateTime bookedAt;

  const Booking({
    required this.id,
    required this.marketDayId,
    required this.memberName,
    required this.phone,
    required this.stallNumber,
    required this.bookedAt,
  });

  /// JSON (Map) se Booking object banata hai
  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] as String,
      marketDayId: json['marketDayId'] as String,
      memberName: json['memberName'] as String,
      phone: json['phone'] as String,
      stallNumber: json['stallNumber'] as int,
      bookedAt: DateTime.parse(json['bookedAt'] as String),
    );
  }

  /// Booking object ko Map mein convert karta hai
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marketDayId': marketDayId,
      'memberName': memberName,
      'phone': phone,
      'stallNumber': stallNumber,
      'bookedAt': bookedAt.toIso8601String(),
    };
  }
}