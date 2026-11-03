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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Icon(Icons.agriculture, size: 72, color: Colors.green),
            const SizedBox(height: 8),
            const Text(
              'GreenField Farmers Co-op',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text('Upcoming Market Days'),
            const Divider(height: 32),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: loadDays(),
                builder: (context, snap) {
                  if (snap.hasError) {
                    return Center(child: Text('Error: ${snap.error}'));
                  }
                  if (!snap.hasData) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }
                  final days = snap.data!;
                  return ListView.builder(
                    itemCount: days.length,
                    itemBuilder: (_, i) => ListTile(
                      leading: const Icon(Icons.storefront),
                      title:
                      Text('${days[i]['date']} - ${days[i]['time']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}