import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'models/prayer.dart';
import 'widgets/prayer_screen_template.dart';

class TasyahudAwalScreen extends StatefulWidget {
  const TasyahudAwalScreen({super.key});

  @override
  State<TasyahudAwalScreen> createState() => _TasyahudAwalScreenState();
}

class _TasyahudAwalScreenState extends State<TasyahudAwalScreen> {
  Prayer? prayer;
  final List<String> images = [
    'assets/images/duduk_antara_sujud_1.png',
    'assets/images/tasyahud_awal.png',
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
            .where((prayer) => prayer.id == 'tasyahud_awal')
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
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Colors.deepPurple),
        ),
      );
    }

    return PrayerScreenTemplate(
      title: 'Tasyahud Awal',
      imagePaths: images,
      prayer: prayer!,
      useCarousel: true,
      explanation:
          'Tasyahud Awal adalah duduk di antara dua rakaat terakhir dalam shalat '
          'yang terdiri dari tiga atau empat rakaat. Pada posisi ini, kaki kiri diduduki dan '
          'kaki kanan ditegakkan dengan jari-jari menghadap kiblat. Jari telunjuk tangan kanan '
          'diangkat sebagai isyarat tauhid saat mengucapkan kalimat syahadat. Bacaan yang '
          'dibaca adalah tahiyat, shalawat kepada Nabi Muhammad SAW.',
      explanationTitle: 'Tentang',
    );
  }
}
