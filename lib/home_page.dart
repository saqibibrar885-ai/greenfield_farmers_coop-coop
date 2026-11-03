import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<List<dynamic>> loadDays() async {
    final text =
    await rootBundle.loadString('assets/market_days.json');
    return jsonDecode(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('GreenField Farmers Co-op')),
      body: FutureBuilder<List<dynamic>>(
        future: loadDays(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final days = snap.data!;
          return ListView.builder(
            itemCount: days.length,
            itemBuilder: (_, i) => ListTile(
              leading: const Icon(Icons.storefront),
              title: Text('${days[i]['date']} - ${days[i]['time']}'),
            ),
          );
        },
      ),
    );
  }
}