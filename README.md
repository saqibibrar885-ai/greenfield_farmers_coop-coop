# GreenField Farmers Co-op Stall Booking App
A Flutter app for co-op members to view market dates and book stalls.
## Data layer
`MarketDay` and `Booking` models (lib/models) with fromJson/toJson. `MarketDayService` (lib/services) reads assets/market_days.json and returns a List<MarketDay>. Verified with a unit test (`flutter test`).