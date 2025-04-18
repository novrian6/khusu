import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'models/prayer.dart';
import 'widgets/prayer_screen_template.dart';

class SalamScreen extends StatefulWidget {
  const SalamScreen({super.key});

  @override
  State<SalamScreen> createState() => _SalamScreenState();
}

class _SalamScreenState extends State<SalamScreen> {
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
            .where((prayer) => prayer.id == 'salam')
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
      title: 'Salam',
      imagePath: 'assets/images/salam.png',
      prayer: prayer!,
      explanation:
          'Salam adalah gerakan terakhir dalam shalat yang menandakan berakhirnya '
          'shalat. Dilakukan dengan menoleh ke kanan dan ke kiri sambil mengucapkan salam. '
          'Ketika menoleh ke kanan, mengucapkan "Assalamu\'alaikum wa rahmatullah" lalu '
          'menoleh ke kiri dengan ucapan yang sama. Gerakan ini menyimbolkan perdamaian dan '
          'rahmat yang kita sebarkan kepada semua yang ada di sekitar kita.',
      explanationTitle: 'Tentang',
    );
  }
}
