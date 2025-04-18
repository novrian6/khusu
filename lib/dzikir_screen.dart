import 'package:flutter/material.dart';

class DzikirScreen extends StatelessWidget {
  const DzikirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dzikirContent = [
      {
        "arabic": "سُبْحَانَ اللَّهِ",
        "transliteration": "Subhanallah",
        "indonesian": "Maha Suci Allah.",
        "english": "Glory be to Allah.",
        "count": "33x",
      },
      {
        "arabic": "الْحَمْدُ لِلَّهِ",
        "transliteration": "Alhamdulillah",
        "indonesian": "Segala puji bagi Allah.",
        "english": "All praise is due to Allah.",
        "count": "33x",
      },
      {
        "arabic": "اللَّهُ أَكْبَرُ",
        "transliteration": "Allahu Akbar",
        "indonesian": "Allah Maha Besar.",
        "english": "Allah is the Greatest.",
        "count": "33x",
      },
      {
        "arabic":
            "لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ",
        "transliteration":
            "La ilaha illallah wahdahu la sharika lahu, lahul-mulku walahul-hamdu wahuwa 'ala kulli shay'in qadir",
        "indonesian":
            "Tidak ada Tuhan selain Allah, Yang Maha Esa, tidak ada sekutu bagi-Nya. Milik-Nya kerajaan dan segala pujian, dan Dia Maha Kuasa atas segala sesuatu.",
        "english":
            "There is no deity except Allah, alone, without partner. To Him belongs the dominion and all praise, and He is over all things competent.",
      },
      {
        "arabic":
            "اللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ، تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ",
        "transliteration":
            "Allahumma anta as-salam wa minka as-salam, tabarakta ya dhal-jalali wal-ikram",
        "indonesian":
            "Ya Allah, Engkaulah sumber keselamatan, dan dari-Mu datang keselamatan. Maha Suci Engkau, wahai Pemilik Keagungan dan Kemuliaan.",
        "english":
            "O Allah, You are Peace, and from You comes peace. Blessed are You, O Possessor of glory and honor.",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dzikir Setelah Sholat'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: dzikirContent.length,
        itemBuilder: (context, index) {
          final dzikir = dzikirContent[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dzikir['arabic']!,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      dzikir['transliteration']!,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      dzikir['indonesian']!,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      dzikir['english']!,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                      ),
                    ),
                    if (dzikir.containsKey('count')) ...[
                      const SizedBox(height: 8.0),
                      Text(
                        'Pengulangan: ${dzikir['count']}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
