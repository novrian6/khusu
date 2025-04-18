import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart' as logging;

class BerdiriTegakScreen extends StatefulWidget {
  const BerdiriTegakScreen({super.key});

  @override
  State<BerdiriTegakScreen> createState() => _BerdiriTegakScreenState();
}

class _BerdiriTegakScreenState extends State<BerdiriTegakScreen> {
  List<Map<String, dynamic>> surahList = [];
  final logging.Logger _logger = logging.Logger('BerdiriTegakScreen');
  Map<String, dynamic>? selectedSurah;

  @override
  void initState() {
    super.initState();
    _logger.info('Initializing BerdiriTegakScreen');
    loadAllSurahData();
  }

  Future<void> loadAllSurahData() async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      // Filter JSON files in the assets/json directory
      final surahFiles =
          manifestMap.keys
              .where(
                (key) =>
                    key.startsWith('assets/json/') && key.endsWith('.json'),
              )
              .toList();

      _logger.info('Detected Surah Files: $surahFiles'); // Log detected files

      List<Map<String, dynamic>> loadedSurahList = [];
      for (var filePath in surahFiles) {
        final surahData = await rootBundle.loadString(filePath);
        final surah = json.decode(surahData) as Map<String, dynamic>;

        _logger.info('Loaded Surah: ${surah['name']}'); // Log each loaded Surah

        // Use 'ayahs' for the list of verses
        // final ayahs = surah['ayahs'] is List ? surah['ayahs'] : [];

        loadedSurahList.add({
          'name': surah['name'],
          'ayahs': surah['ayahs'], // Directly use the 'ayahs' list
          'number': surah['number'], // Extract the Surah number
          'verses': surah['verses'], // Extract the total number of verses
        });
      }

      setState(() {
        // Sort surahList by 'number' before updating
        surahList =
            loadedSurahList..sort(
              (a, b) => (a['number'] as int).compareTo(b['number'] as int),
            );
      });

      _logger.info('Final Surah List: $surahList'); // Log final Surah list
    } catch (e, stackTrace) {
      _logger.severe('Error loading Surah data', e, stackTrace);
      //  print('Error loading Surah data: $e'); // Debug print
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> alFatihah = [
      {
        'arabic': 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ',
        'transliteration': 'Bismillahirrahmanirrahim',
        'indonesian': 'Dengan nama Allah Yang Maha Pengasih, Maha Penyayang.',
        'english':
            'In the name of Allah, the Most Gracious, the Most Merciful.',
      },
      {
        'arabic': 'الْحَمْدُ لِلّٰهِ رَبِّ الْعَالَمِينَ',
        'transliteration': 'Alhamdulillahi Rabbil-‘Alamin',
        'indonesian': 'Segala puji bagi Allah, Tuhan seluruh alam.',
        'english': 'Praise be to Allah, the Lord of all the worlds.',
      },
      {
        'arabic': 'الرَّحْمٰنِ الرَّحِيْمِ',
        'transliteration': 'Ar-Rahmanir-Rahim',
        'indonesian': 'Yang Maha Pengasih, Maha Penyayang.',
        'english': 'The Most Gracious, the Most Merciful.',
      },
      {
        'arabic': 'مٰلِكِ يَوْمِ الدِّينِ',
        'transliteration': 'Maliki Yawmid-Din',
        'indonesian': 'Pemilik hari pembalasan.',
        'english': 'Master of the Day of Judgment.',
      },
      {
        'arabic': 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
        'transliteration': 'Iyyaka na’budu wa iyyaka nasta’in',
        'indonesian':
            'Hanya kepada-Mu kami menyembah dan hanya kepada-Mu kami memohon pertolongan.',
        'english': 'You alone we worship, and You alone we ask for help.',
      },
      {
        'arabic': 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
        'transliteration': 'Ihdinas-siratal-mustaqim',
        'indonesian': 'Tunjukilah kami jalan yang lurus,',
        'english': 'Guide us on the Straight Path,',
      },
      {
        'arabic':
            'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ',
        'transliteration':
            'Siratal-ladhina an’amta ‘alayhim ghayril-maghzubi ‘alayhim wa la-d-dallin.',
        'indonesian':
            'yaitu jalan orang-orang yang telah Engkau beri nikmat kepada mereka; bukan jalan mereka yang dimurkai, dan bukan pula jalan mereka yang sesat.',
        'english':
            'the path of those who have received Your grace; not the path of those who have brought down wrath upon themselves, nor of those who have gone astray.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Berdiri Tegak',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Berdiri Tegak',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 12.0),
            const Divider(thickness: 2.0, color: Colors.deepPurple),
            const SizedBox(height: 20.0),

            const Text(
              'Saat berdiri tegak, dimulai dengan membaca Al-Fatihah. Setelah itu, lanjutkan dengan membaca salah satu surah atau lebih dari pilihan berikut.',
              style: TextStyle(fontSize: 18.0, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20.0),

            ExpansionTile(
              title: const Text(
                '1. Baca Al-Fatihah',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              children: [
                const SizedBox(height: 16.0),
                for (var i = 0; i < alFatihah.length; i++) ...[
                  const SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${i + 1}. ${alFatihah[i]['arabic']}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          alFatihah[i]['transliteration']!,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          alFatihah[i]['indonesian']!,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          alFatihah[i]['english']!,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ],
            ),
            const SizedBox(height: 20.0),
            ExpansionTile(
              title: const Text(
                '2. Baca Surat',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              children: [
                const SizedBox(height: 16.0),
                const Text(
                  'Informasi:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Anda dapat memilih surat apa saja dari Al-Qur\'an untuk dibaca setelah Al-Fatihah.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Pilih Surat:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8.0),
                DropdownButtonFormField<String>(
                  items:
                      surahList
                          .map(
                            (surah) => DropdownMenuItem<String>(
                              value: surah['name'] as String,
                              child: Text(
                                '${surah['number']}. ${surah['name']} (${surah['verses']} Ayat)',
                                style: const TextStyle(fontSize: 18.0),
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSurah = surahList.firstWhere(
                        (surah) => surah['name'] == value,
                      );
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Colors.deepPurple.shade50,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                if (selectedSurah != null) ...[
                  Text(
                    'Surah ${selectedSurah!['name']}',
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  if (selectedSurah!['ayahs'] is List) ...[
                    for (
                      var i = 0;
                      i < selectedSurah!['ayahs'].length;
                      i++
                    ) ...[
                      const SizedBox(height: 8.0),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade50,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedSurah!['ayahs'][i]['arabic'] ?? '',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              selectedSurah!['ayahs'][i]['transliteration'] ??
                                  '',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontStyle: FontStyle.italic,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              selectedSurah!['ayahs'][i]['indonesian'] ?? '',
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              selectedSurah!['ayahs'][i]['english'] ?? '',
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ] else ...[
                    const Text(
                      'No verses available for this Surah.',
                      style: TextStyle(fontSize: 18.0, color: Colors.red),
                    ),
                  ],
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
