import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/prayer.dart';

class RukukScreen extends StatefulWidget {
  const RukukScreen({super.key});

  @override
  State<RukukScreen> createState() => _RukukScreenState();
}

class _RukukScreenState extends State<RukukScreen> {
  Prayer? prayer;

  @override
  void initState() {
    super.initState();
    loadPrayer();
  }

  Future<void> loadPrayer() async {
    final String jsonContent = await rootBundle.loadString(
      'assets/data/prayers.json',
    );
    final data = json.decode(jsonContent);
    final prayers =
        (data['prayers'] as List)
            .map((item) => Prayer.fromJson(item))
            .where((prayer) => prayer.id == 'rukuk')
            .toList();

    if (prayers.isNotEmpty) {
      setState(() {
        prayer = prayers.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rukuk'),
        backgroundColor: Colors.deepPurple,
      ),
      body:
          prayer == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            'assets/images/rukuk.png',
                            width: 300,
                            height: 300,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        prayer!.arabicText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32.0,
                          fontFamily: 'Arabic',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Transliteration:\n${prayer!.transliteration}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Arti:\n${prayer!.indonesianTranslation}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Meaning:\n${prayer!.englishTranslation}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
