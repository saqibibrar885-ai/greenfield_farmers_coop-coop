import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/market_day.dart';

class MarketDayService {
  Future<List<MarketDay>> fetchDays() async {
    final text = await rootBundle.loadString('assets/market_days.json');
    final List<dynamic> data = jsonDecode(text);
    return data
        .map((e) => MarketDay.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}