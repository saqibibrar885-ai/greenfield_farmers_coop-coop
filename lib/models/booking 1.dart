class Booking {
  final String memberName;
  final String phone;
  final String marketDate;

  const Booking({
    required this.memberName,
    required this.phone,
    required this.marketDate,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    memberName: json['memberName'] as String,
    phone: json['phone'] as String,
    marketDate: json['marketDate'] as String,
  );

  Map<String, dynamic> toJson() => {
    'memberName': memberName,
    'phone': phone,
    'marketDate': marketDate,
  };
}