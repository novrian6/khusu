import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'models/prayer.dart';
import 'widgets/prayer_screen_template.dart';

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
    if (prayer == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return PrayerScreenTemplate(
      title: 'Rukuk',
      imagePath: 'assets/images/ruku.png',
      prayer: prayer!,
      explanation:
          'Rukuk adalah gerakan membungkukkan badan dengan kedua tangan memegang lutut '
          'dan punggung sejajar, kepala tidak terangkat atau tertunduk. Gerakan ini dilakukan '
          'setelah berdiri dan sebelum sujud dalam shalat. Rukuk menunjukkan sikap rendah hati '
          'dan penghormatan kepada Allah SWT.',
    );
  }
}
