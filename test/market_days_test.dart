import 'package:flutter_test/flutter_test.dart';
import 'package:greenfield_farmers_coop/services/market_day_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('parses at least three market days from JSON', () async {
    final days = await MarketDayService().fetchDays();
    expect(days.length, greaterThanOrEqualTo(3));
    expect(days.first.date, isNotEmpty);
  });
}