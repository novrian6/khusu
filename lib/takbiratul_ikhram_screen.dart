import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'models/prayer.dart';
import 'widgets/prayer_screen_template.dart';

class TakbiratulIhramScreen extends StatefulWidget {
  const TakbiratulIhramScreen({super.key});

  @override
  State<TakbiratulIhramScreen> createState() => _TakbiratulIhramScreenState();
}

class _TakbiratulIhramScreenState extends State<TakbiratulIhramScreen> {
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
            .where((prayer) => prayer.id == 'takbiratul_ihram')
            .toList();

    if (prayers.isNotEmpty) {
      setState(() {
        prayer = prayers.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (prayer == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return PrayerScreenTemplate(
      title: 'Takbiratul Ihram',
      imagePath: 'assets/images/takbiratul_ikhram.png',
      prayer: prayer!,
      explanation:
          'Takbiratul Ihram adalah takbir pembuka yang menandai dimulainya '
          'shalat. Gerakan ini dilakukan dengan mengangkat kedua tangan sejajar '
          'dengan telinga atau bahu, sambil mengucapkan "Allahu Akbar". Takbiratul '
          'Ihram memiliki arti khusus karena mengharamkan segala perbuatan yang '
          'biasa dilakukan di luar shalat, seperti makan, minum, dan berbicara.',
      explanationTitle: 'Tentang',
    );
  }
}
