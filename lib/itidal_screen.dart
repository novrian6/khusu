import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'models/prayer.dart';
import 'widgets/prayer_screen_template.dart';

class ItidalScreen extends StatefulWidget {
  const ItidalScreen({super.key});

  @override
  State<ItidalScreen> createState() => _ItidalScreenState();
}

class _ItidalScreenState extends State<ItidalScreen> {
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
            .where((prayer) => prayer.id == 'itidal')
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
      title: 'I\'tidal',
      imagePath: 'assets/images/itidal.png',
      prayer: prayer!,
      explanation:
          'I\'tidal merupakan gerakan bangkit dari rukuk dengan '
          'badan tegak lurus, tangan diluruskan ke bawah di samping badan. '
          'Gerakan ini dilakukan setelah rukuk dan sebelum sujud. Pada saat i\'tidal, '
          'dianjurkan untuk mengucapkan "Sami\'allahu liman hamidah, Rabbana lakal hamd". '
          'I\'tidal menunjukkan sikap penyerahan diri sepenuhnya dengan berdiri tegak '
          'di hadapan Allah SWT.',
      explanationTitle: 'Tentang',
    );
  }
}
