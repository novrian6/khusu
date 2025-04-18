import 'package:flutter/material.dart';
import 'models/prayer.dart';
import 'widgets/prayer_screen_template.dart';

class BerdiriRakaatScreen extends StatelessWidget {
  const BerdiriRakaatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a simple prayer object for this screen
    final Prayer berdiriRakaatPrayer = Prayer(
      id: 'berdiri_rakaat',
      title: 'Berdiri Tegak Rakaat',
      description: 'This is the standing position during the rakaat in prayer.',
      arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ وَبِحَمْدِهِ',
      transliteration: 'Al-Fatihah dan surah/ayat Al-Quran lainnya',
      indonesianTranslation:
          'Membaca Surah Al-Fatihah dan dilanjutkan dengan membaca surah atau ayat Al-Quran lainnya. Pada rakaat ketiga dan keempat, umumnya hanya membaca Surah Al-Fatihah.',
      englishTranslation:
          'Recite Surah Al-Fatihah followed by another surah or verses from the Quran. In the third and fourth rakaat, usually only Surah Al-Fatihah is recited.',
    );

    // Detailed explanation for this position
    final String explanation =
        '1. Setelah takbiratul ihram atau bangkit dari sujud terakhir rakaat sebelumnya, '
        'berdiri tegak dengan tenang.\n\n'
        '2. Posisi badan:\n'
        '   • Berdiri tegak dan lurus\n'
        '   • Pandangan mengarah ke tempat sujud\n'
        '   • Kedua kaki sejajar dengan jarak secukupnya\n'
        '   • Tangan diletakkan di atas pusar, tangan kanan di atas tangan kiri\n\n'
        '3. Hal yang perlu diperhatikan:\n'
        '   • Jaga ketenangan dan fokus\n'
        '   • Tidak menoleh ke kanan atau ke kiri\n'
        '   • Tidak menggerakkan anggota badan dengan gerakan di luar gerakan shalat\n'
        '   • Khusyuk dalam membaca bacaan shalat';

    return PrayerScreenTemplate(
      title: 'Berdiri Tegak Rakaat',
      imagePath: 'assets/images/bersedekap.png',
      prayer: berdiriRakaatPrayer,
      explanation: explanation,
      explanationTitle: 'Tentang',
    );
  }
}
