import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'surah_detail_screen.dart'; // Import the new screen
import 'dart:developer'; // Import logging framework

class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  List<Map<String, dynamic>> surahList = [];
  Map<int, List<Map<String, dynamic>>> surahsByJuz = {};

  @override
  void initState() {
    super.initState();
    loadAllSurahData();
  }

  Future<void> loadAllSurahData() async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      final surahFiles =
          manifestMap.keys
              .where(
                (key) =>
                    key.startsWith('assets/json/surah/') && // Updated path
                    key.endsWith('.json'),
              )
              .toList();

      List<Map<String, dynamic>> loadedSurahList = [];
      for (var filePath in surahFiles) {
        final surahData = await rootBundle.loadString(filePath);
        final surah = json.decode(surahData) as Map<String, dynamic>;

        loadedSurahList.add({
          'name': surah['name'],
          'number': surah['number'],
          'juz': surah['no_juzz'],
          'verses': surah['verses'],
          'ayahs':
              surah['ayahs'] is List
                  ? surah['ayahs']
                  : [], // Ensure ayahs is a list
        });
      }

      // Group surahs by juz
      final Map<int, List<Map<String, dynamic>>> groupedSurahs = {};
      for (var surah in loadedSurahList) {
        final juz = surah['juz'] as int;
        if (!groupedSurahs.containsKey(juz)) {
          groupedSurahs[juz] = [];
        }
        groupedSurahs[juz]!.add(surah);
      }

      setState(() {
        surahList =
            loadedSurahList..sort(
              (a, b) => (a['number'] as int).compareTo(b['number'] as int),
            );
        surahsByJuz = Map.fromEntries(
          groupedSurahs.entries.toList()
            ..sort((a, b) => a.key.compareTo(b.key)),
        );
      });
    } catch (e) {
      log('Error loading Surah data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al-Quran'),
        backgroundColor: Colors.deepPurple,
      ),
      body:
          surahList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: surahsByJuz.length,
                itemBuilder: (context, index) {
                  final juzNumber = surahsByJuz.keys.elementAt(index);
                  final surahsInJuz = surahsByJuz[juzNumber]!;

                  return ExpansionTile(
                    initiallyExpanded: true,
                    backgroundColor: Colors.grey[50],
                    title: Text(
                      'Juz $juzNumber',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    children:
                        surahsInJuz.map((surah) {
                          return Card(
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: ListTile(
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    surah['number'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                surah['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                '${surah['verses']} Ayat',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.deepPurple,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => SurahDetailScreen(
                                          surahName: surah['name'],
                                          ayahs: surah['ayahs'],
                                        ),
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                  );
                },
              ),
    );
  }
}
