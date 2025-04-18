import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'models/prayer.dart';
import 'widgets/prayer_screen_template.dart';

class SujudScreen extends StatefulWidget {
  const SujudScreen({super.key});

  @override
  State<SujudScreen> createState() => _SujudScreenState();
}

class _SujudScreenState extends State<SujudScreen> {
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
            .where((prayer) => prayer.id == 'sujud')
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
      title: 'Sujud',
      imagePath: 'assets/images/sujud.png',
      prayer: prayer!,
      explanation:
          'Sujud adalah gerakan membungkukkan badan hingga dahi menyentuh tanah '
          'sebagai bentuk puncak kerendahan hamba di hadapan Allah. Ketika sujud, '
          'tujuh anggota tubuh harus menyentuh lantai: dahi, kedua telapak tangan, '
          'kedua lutut, dan ujung kedua kaki. Sujud dilakukan dua kali dalam setiap '
          'rakaat shalat.',
      explanationTitle: 'Tentang',
    );
  }
}
