import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'models/prayer.dart';
import 'widgets/prayer_screen_template.dart';

class DudukAntaraSujudScreen extends StatefulWidget {
  const DudukAntaraSujudScreen({super.key});

  @override
  State<DudukAntaraSujudScreen> createState() => _DudukAntaraSujudScreenState();
}

class _DudukAntaraSujudScreenState extends State<DudukAntaraSujudScreen> {
  Prayer? prayer;
  final List<String> _images = [
    'assets/images/duduk_antara_sujud_1.png',
    'assets/images/duduk_antara_sujud_2.png',
  ];

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
            .where((prayer) => prayer.id == 'duduk_antara_sujud')
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
      title: 'Duduk Antara Dua Sujud',
      imagePaths: _images,
      prayer: prayer!,
      explanation:
          'Duduk antara dua sujud adalah gerakan dan posisi untuk '
          'istirahat sejenak yang dilakukan setelah sujud pertama dan sebelum '
          'sujud kedua dalam satu rakaat shalat. Pada posisi ini, kaki kiri '
          'dilipat dan diduduki, sementara kaki kanan tetap tegak dengan jari-jari '
          'kaki menghadap kiblat. Kedua tangan diletakkan di atas lutut dengan '
          'jari terbuka. Pada posisi ini, dianjurkan membaca doa memohon ampunan, '
          'rahmat, petunjuk, kesehatan, dan rezeki dari Allah SWT.',
      explanationTitle: 'Tentang',
      useCarousel: true,
    );
  }
}
