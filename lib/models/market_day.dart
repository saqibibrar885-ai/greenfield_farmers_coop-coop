class MarketDay {
  final String date;
  final String time;

  const MarketDay({required this.date, required this.time});

  factory MarketDay.fromJson(Map<String, dynamic> json) => MarketDay(
    date: json['date'] as String,
    time: json['time'] as String,
  );

  Map<String, dynamic> toJson() => {'date': date, 'time': time};
}