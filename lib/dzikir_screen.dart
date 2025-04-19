import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khusu/models/matsurat_model.dart';

class DzikirScreen extends StatefulWidget {
  const DzikirScreen({super.key});

  @override
  State<DzikirScreen> createState() => _DzikirScreenState();
}

class _DzikirScreenState extends State<DzikirScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, String?>> _matsuraatPagiContent = [];
  List<Map<String, String?>> _matsuraatPetangContent = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadMatsuratData();
  }

  Future<void> _loadMatsuratData() async {
    try {
      // Load Al-Ma'tsurat Pagi following the pattern used in SurahDetailScreen
      final pagiJsonString = await rootBundle.loadString(
        'assets/json/doa/almatsurat_kubro_pagi.json',
      );
      final pagiData = jsonDecode(pagiJsonString);
      final MatsuratContent pagiContent = MatsuratContent.fromJson(pagiData);

      // Load Al-Ma'tsurat Petang
      final petangJsonString = await rootBundle.loadString(
        'assets/json/doa/almatsurat_kubro_petang.json',
      );
      final petangData = jsonDecode(petangJsonString);
      final MatsuratContent petangContent = MatsuratContent.fromJson(
        petangData,
      );

      // Update state with the loaded data
      setState(() {
        _matsuraatPagiContent =
            pagiContent.content.map((item) => item.toDzikirMap()).toList();
        _matsuraatPetangContent =
            petangContent.content.map((item) => item.toDzikirMap()).toList();
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading matsurat data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Dzikir Setelah Sholat content - keep the existing hardcoded content
    final List<Map<String, String?>> dzikirSetelahSholatContent = [
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
        title: const Text('Dzikir & Al-Ma\'tsurat'),
        backgroundColor: Colors.deepPurple,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Dzikir Sholat'),
            Tab(text: 'Al-Ma\'tsurat Pagi'),
            Tab(text: 'Al-Ma\'tsurat Petang'),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
        ),
      ),
      body:
          _isLoading
              ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading Al-Ma\'tsurat data...'),
                  ],
                ),
              )
              : TabBarView(
                controller: _tabController,
                children: [
                  // Dzikir Setelah Sholat Tab
                  _buildDzikirList(dzikirSetelahSholatContent),

                  // Al-Ma'tsurat Pagi Tab
                  _buildDzikirList(_matsuraatPagiContent),

                  // Al-Ma'tsurat Petang Tab
                  _buildDzikirList(_matsuraatPetangContent),
                ],
              ),
    );
  }

  Widget _buildDzikirList(List<Map<String, String?>> dzikirItems) {
    if (dzikirItems.isEmpty) {
      return const Center(
        child: Text(
          'No data available',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }

    return ListView.builder(
      itemCount: dzikirItems.length,
      itemBuilder: (context, index) {
        final dzikir = dzikirItems[index];
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
                  if (dzikir.containsKey('reference') &&
                      dzikir['reference'] != null) ...[
                    const SizedBox(height: 8.0),
                    Text(
                      dzikir['reference']!,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                  if (dzikir.containsKey('count') &&
                      dzikir['count'] != null) ...[
                    const SizedBox(height: 8.0),
                    Text(
                      'Jumlah Pengulangan: ${dzikir['count']}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                  // Add repeat count display for Al-Ma'tsurat items if they have repeat info
                  if (dzikir.containsKey('repeat') &&
                      dzikir['repeat'] != null) ...[
                    const SizedBox(height: 8.0),
                    Text(
                      'Jumlah Pengulangan: ${dzikir['repeat']}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
