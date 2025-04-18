import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:developer';
import 'bacaan_detail_screen.dart';
import 'surah_detail_screen.dart'; // Import the missing SurahDetailScreen
import 'surah_detail_with_quran_style_screen.dart'; // Add this import

class BerdiriSurahScreen extends StatefulWidget {
  const BerdiriSurahScreen({super.key});

  @override
  State<BerdiriSurahScreen> createState() => _BerdiriSurahScreenState();
}

class _BerdiriSurahScreenState extends State<BerdiriSurahScreen> {
  // List of short surahs commonly recited in prayer
  List<int> commonSurahNumbers = [
    1,
    103,
    108,
    109,
    112,
    113,
    114,
  ]; // Add/remove surah numbers as needed
  List<Map<String, dynamic>> commonSurahs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCommonSurahs();
  }

  Future<void> loadCommonSurahs() async {
    try {
      setState(() {
        isLoading = true;
      });

      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      final surahFiles =
          manifestMap.keys
              .where(
                (key) =>
                    key.startsWith('assets/json/surah/') &&
                    key.endsWith('.json'),
              )
              .toList();

      List<Map<String, dynamic>> loadedSurahs = [];

      for (var filePath in surahFiles) {
        final fileData = await rootBundle.loadString(filePath);
        final surahData = json.decode(fileData) as Map<String, dynamic>;

        // Only add surahs that are in our common surah list
        if (commonSurahNumbers.contains(surahData['number'])) {
          loadedSurahs.add({
            'name': surahData['name'],
            'number': surahData['number'],
            'translation': surahData['translation'] ?? '',
            'verses': surahData['verses'],
            'ayahs': surahData['ayahs'] is List ? surahData['ayahs'] : [],
          });
        }
      }

      setState(() {
        // Sort surahs by their number in ascending order
        commonSurahs =
            loadedSurahs..sort(
              (a, b) => (a['number'] as int).compareTo(b['number'] as int),
            );
        isLoading = false;
      });
    } catch (e) {
      log('Error loading common Surah data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  // Helper method to convert numbers to Arabic numerals
  String _convertToArabicNumber(int number) {
    const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number
        .toString()
        .split('')
        .map((digit) => arabicNumbers[int.parse(digit)])
        .join();
  }

  void _showSurahDetail(BuildContext context, Map<String, dynamic> surah) {
    // Use SurahDetailWithQuranStyleScreen for better Quranic style ayah numbers
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => SurahDetailWithQuranStyleScreen(
              surahName: surah['name'],
              ayahs: surah['ayahs'],
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berdiri Tegak (Surah)'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Color(0xFFF5F5F5)],
            stops: [0.0, 0.3],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 24.0, left: 8.0),
                child: Text(
                  'Berdiri Tegak (Surah)',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Keutamaan:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Penjelasan Gerakan',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Berdiri tegak dengan posisi yang sama seperti saat membaca Al-Fatihah, '
                        'tetapi pada posisi ini kita membaca ayat-ayat Al-Quran atau surah setelah membaca Al-Fatihah.',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade800,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Keutamaan:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '• Disunnahkan membaca surah atau ayat Al-Quran setelah Al-Fatihah pada rakaat pertama dan kedua\n'
                        '• Pada rakaat ketiga dan keempat, membaca surah setelah Al-Fatihah adalah boleh (opsional)\n'
                        '• Dianjurkan untuk membaca surah yang berbeda pada rakaat pertama dan kedua',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade800,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cara Melakukan:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        '1. Tetap berdiri tegak setelah membaca Al-Fatihah\n'
                        '2. Mulailah membaca surah atau ayat Al-Quran yang Anda hafal\n'
                        '3. Bacalah dengan tartil dan penuh penghayatan\n'
                        '4. Dianjurkan untuk membaca surah-surah pendek yang Anda hafal dengan baik',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade800,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Pilihan Surah',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Berikut adalah beberapa surah pendek yang sering dibaca dalam shalat:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16.0),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : commonSurahs.isEmpty
                  ? const Center(child: Text('Tidak ada surah yang tersedia.'))
                  : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: commonSurahs.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final surah = commonSurahs[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepPurple.shade100,
                          child: Text(
                            '${surah['number']}',
                            style: const TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          surah['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        subtitle: Text(
                          surah['translation'] ?? '',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: Text(
                          '${surah['verses']} Ayat',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        onTap: () => _showSurahDetail(context, surah),
                      );
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
