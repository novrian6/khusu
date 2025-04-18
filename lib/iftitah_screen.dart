import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'models/prayer.dart';
import 'widgets/prayer_screen_template.dart';

class IftitahScreen extends StatefulWidget {
  const IftitahScreen({super.key});

  @override
  State<IftitahScreen> createState() => _IftitahScreenState();
}

class _IftitahScreenState extends State<IftitahScreen> {
  Prayer? prayer;
  final List<String> images = ['assets/images/bersedekap.png'];

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
            .where((prayer) => prayer.id == 'doa_iftitah')
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

    final String explanation =
        'Iftitah adalah doa pembuka setelah takbiratul ihram pada shalat. '
        'Dibaca dengan posisi berdiri tegak, tangan bersedekap di depan dada, '
        'pandangan ke tempat sujud. Posisi kaki sejajar dengan jarak secukupnya. '
        'Doa iftitah berisi pujian kepada Allah SWT dan menegaskan niat untuk '
        'beribadah dengan ikhlas. Setelah doa iftitah, dilanjutkan dengan '
        'membaca ta\'awudz, basmalah, dan Surah Al-Fatihah.';

    return PrayerScreenTemplate(
      title: 'Berdiri Tegak (Iftitah)',
      imagePaths: images,
      prayer: prayer!,
      explanation: explanation,
      explanationTitle: 'Tentang',
      useCarousel: true,
    );
  }
}
