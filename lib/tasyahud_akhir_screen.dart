import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'models/prayer.dart';
import 'widgets/prayer_screen_template.dart';

class TasyahudAkhirScreen extends StatefulWidget {
  const TasyahudAkhirScreen({super.key});

  @override
  State<TasyahudAkhirScreen> createState() => _TasyahudAkhirScreenState();
}

class _TasyahudAkhirScreenState extends State<TasyahudAkhirScreen> {
  Prayer? prayer;
  final List<String> images = [
    'assets/images/duduk_antara_sujud_1.png',
    'assets/images/tasyahud_akhir.png',
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
            .where((prayer) => prayer.id == 'tasyahud_akhir')
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
      title: 'Tasyahud Akhir',
      imagePaths: images,
      prayer: prayer!,
      useCarousel: true,
      explanation:
          'Tasyahud Akhir adalah posisi duduk pada akhir shalat sebelum salam. '
          'Dilakukan dengan duduk tawaruk, yaitu kaki kiri dimasukkan ke bawah kaki kanan '
          'sehingga pantat langsung menyentuh lantai, sementara kaki kanan tetap ditegakkan. '
          'Pada posisi ini, jari telunjuk tangan kanan diangkat sebagai isyarat tauhid saat '
          'mengucapkan syahadat. Bacaan tasyahud akhir sama dengan tasyahud awal, namun '
          'ditambah dengan shalawat Ibrahimiyah dan doa meminta perlindungan dari empat hal.',
      explanationTitle: 'Tentang',
    );
  }
}
