import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart' as logging;

class BacaanBerdiriScreen extends StatefulWidget {
  const BacaanBerdiriScreen({super.key});

  @override
  State<BacaanBerdiriScreen> createState() => _BacaanBerdiriScreenState();
}

class _BacaanBerdiriScreenState extends State<BacaanBerdiriScreen> {
  List<Map<String, dynamic>> surahList = [];
  List<Map<String, dynamic>> filteredSurahList = [];
  final logging.Logger _logger = logging.Logger('BerdiriTegakScreen');
  Map<String, dynamic>? selectedSurah;
  bool _isArabicTextEnlarged = false;
  bool _isDarkMode = false;
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Set<int> _bookmarkedVerses = {};
  final FocusNode _searchFocusNode = FocusNode();

  void _toggleArabicTextSize() {
    setState(() {
      _isArabicTextEnlarged = !_isArabicTextEnlarged;
    });
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  /*************  ✨ Windsurf Command ⭐  *************/
  /// Toggle whether a verse is bookmarked or not.
  ///
  /// If the verse is currently bookmarked, remove it from the set.
  /// Otherwise, add it to the set.
  ///
  /*******  617e5192-e23c-494c-8f31-650be41817e6  *******/
  void _toggleBookmark(int verseIndex) {
    setState(() {
      if (_bookmarkedVerses.contains(verseIndex)) {
        _bookmarkedVerses.remove(verseIndex);
      } else {
        _bookmarkedVerses.add(verseIndex);
      }
    });
  }

  void _filterSurah(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredSurahList = List.from(surahList);
      } else {
        filteredSurahList =
            surahList
                .where(
                  (surah) =>
                      surah['name'].toString().toLowerCase().contains(
                        query.toLowerCase(),
                      ) ||
                      surah['number'].toString().contains(query),
                )
                .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _logger.info('Initializing BerdiriTegakScreen');
    loadAllSurahData();
    _searchController.addListener(() {
      _filterSurah(_searchController.text);
    });

    // Register a service to handle keyboard events
    ServicesBinding.instance.keyboard.addHandler(_handleKeyboardEvent);
  }

  // Handler for keyboard events
  bool _handleKeyboardEvent(KeyEvent event) {
    // Handle Control key to prevent the assertion error
    if (event is KeyDownEvent &&
        (event.physicalKey == PhysicalKeyboardKey.controlLeft ||
            event.physicalKey == PhysicalKeyboardKey.controlRight)) {
      return true; // Consume the event
    }
    return false; // Let other handlers process the event
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _searchFocusNode.dispose();

    // Remove the keyboard handler
    ServicesBinding.instance.keyboard.removeHandler(_handleKeyboardEvent);

    super.dispose();
  }

  Future<void> loadAllSurahData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      // Filter JSON files in the /assets/json/surah directory
      final surahFiles =
          manifestMap.keys
              .where(
                (key) =>
                    key.startsWith('assets/json/surah/') &&
                    key.endsWith('.json'),
              )
              .toList();

      _logger.info('Detected Surah Files: $surahFiles'); // Log detected files

      List<Map<String, dynamic>> loadedSurahList = [];
      // Use a set to track unique names
      Set<String> uniqueSurahNames = {};

      for (var filePath in surahFiles) {
        try {
          final surahData = await rootBundle.loadString(filePath);
          final surah = json.decode(surahData) as Map<String, dynamic>;

          // Ensure we have a unique name by checking and possibly appending an identifier
          String surahName = surah['name'].toString();
          if (uniqueSurahNames.contains(surahName)) {
            // If name already exists, make it unique by adding the number
            surahName = "${surahName}_${surah['number']}";
          }
          uniqueSurahNames.add(surahName);

          loadedSurahList.add({
            'name': surahName,
            'displayName': surah['name'], // Keep original name for display
            'ayahs': surah['ayahs'],
            'number': surah['number'],
            'verses': surah['verses'],
          });

          _logger.info('Loaded Surah: $surahName'); // Log each loaded Surah
        } catch (e) {
          _logger.warning('Error processing file $filePath: $e');
        }
      }

      setState(() {
        // Sort surahList by 'number' before updating
        surahList =
            loadedSurahList..sort(
              (a, b) => (a['number'] as int).compareTo(b['number'] as int),
            );
        filteredSurahList = List.from(surahList);
        _isLoading = false;
      });

      _logger.info(
        'Final Surah List: ${surahList.length} items',
      ); // Log final Surah list
    } catch (e, stackTrace) {
      _logger.severe('Error loading Surah data', e, stackTrace);
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
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

    final ThemeData themeData =
        _isDarkMode
            ? ThemeData.dark().copyWith(
              primaryColor: Colors.deepPurple.shade700,
              scaffoldBackgroundColor: Colors.grey.shade900,
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple.shade300,
                secondary: Colors.deepPurple.shade200,
              ),
            )
            : ThemeData.light().copyWith(
              primaryColor: Colors.deepPurple,
              scaffoldBackgroundColor: Colors.white,
              colorScheme: ColorScheme.light(
                primary: Colors.deepPurple,
                secondary: Colors.deepPurple.shade300,
              ),
            );

    final Color cardColor =
        _isDarkMode ? Colors.grey.shade800 : Colors.deepPurple.shade50;

    final Color textColor = _isDarkMode ? Colors.white : Colors.black87;

    final Color secondaryTextColor =
        _isDarkMode ? Colors.white70 : Colors.black54;

    return Theme(
      data: themeData,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Berdiri Tegak',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor:
              _isDarkMode ? Colors.deepPurple.shade900 : Colors.deepPurple,
          centerTitle: true,
          elevation: 4.0,
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: _toggleDarkMode,
              tooltip: 'Toggle Theme',
            ),
            IconButton(
              icon: const Icon(Icons.font_download),
              onPressed: _toggleArabicTextSize,
              tooltip: _isArabicTextEnlarged ? 'Normal Size' : 'Large Size',
            ),
          ],
        ),
        body:
            _isLoading
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: themeData.colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Memuat data surah...',
                        style: TextStyle(fontSize: 18.0, color: textColor),
                      ),
                    ],
                  ),
                )
                : SingleChildScrollView(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Berdiri Tegak',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: themeData.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Divider(
                        thickness: 2.0,
                        color: themeData.colorScheme.primary,
                      ),
                      const SizedBox(height: 20.0),

                      Text(
                        'Saat berdiri tegak, dimulai dengan membaca Al-Fatihah. Setelah itu, lanjutkan dengan membaca salah satu surah atau lebih dari pilihan berikut.',
                        style: TextStyle(fontSize: 18.0, color: textColor),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20.0),

                      Card(
                        elevation: 4,
                        margin: const EdgeInsets.only(bottom: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: cardColor,
                        child: ExpansionTile(
                          leading: Icon(
                            Icons.menu_book,
                            color: themeData.colorScheme.primary,
                            size: 28,
                          ),
                          title: Text(
                            '1. Baca Al-Fatihah',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          childrenPadding: const EdgeInsets.all(16.0),
                          children: [
                            const SizedBox(height: 16.0),
                            for (var i = 0; i < alFatihah.length; i++) ...[
                              const SizedBox(height: 8.0),
                              Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide(
                                    color: themeData.colorScheme.primary
                                        .withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                color: cardColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              color:
                                                  themeData.colorScheme.primary,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${i + 1}',
                                                style: const TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Divider(
                                              color:
                                                  themeData.colorScheme.primary,
                                              thickness: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16.0),
                                      GestureDetector(
                                        onDoubleTap: _toggleArabicTextSize,
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color:
                                                _isDarkMode
                                                    ? Colors.black38
                                                    : Colors.deepPurple.shade50
                                                        .withOpacity(0.7),
                                            borderRadius: BorderRadius.circular(
                                              8.0,
                                            ),
                                          ),
                                          child: Text(
                                            alFatihah[i]['arabic']!,
                                            style: TextStyle(
                                              fontSize:
                                                  _isArabicTextEnlarged
                                                      ? 32.0
                                                      : 20.0,
                                              fontFamily: 'Amiri',
                                              fontWeight: FontWeight.bold,
                                              color: textColor,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 12.0),
                                      Text(
                                        alFatihah[i]['transliteration']!,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontStyle: FontStyle.italic,
                                          color: textColor,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        alFatihah[i]['indonesian']!,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: textColor,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        alFatihah[i]['english']!,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: secondaryTextColor,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          ],
                        ),
                      ),

                      const SizedBox(height: 20.0),

                      Card(
                        elevation: 4,
                        margin: const EdgeInsets.only(bottom: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: cardColor,
                        child: ExpansionTile(
                          leading: Icon(
                            Icons.auto_stories,
                            color: themeData.colorScheme.primary,
                            size: 28,
                          ),
                          title: Text(
                            '2. Baca Surat',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          childrenPadding: const EdgeInsets.all(16.0),
                          children: [
                            const SizedBox(height: 16.0),
                            Text(
                              'Informasi:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Anda dapat memilih surat apa saja dari Al-Qur\'an untuk dibaca setelah Al-Fatihah.',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Cari Surat:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            TextField(
                              controller: _searchController,
                              focusNode: _searchFocusNode,
                              decoration: InputDecoration(
                                hintText: 'Ketik nomor atau nama surat...',
                                fillColor:
                                    _isDarkMode
                                        ? Colors.grey.shade700
                                        : Colors.white,
                                filled: true,
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon:
                                    _searchController.text.isNotEmpty
                                        ? IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: () {
                                            _searchController.clear();
                                            _filterSurah('');
                                          },
                                        )
                                        : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: themeData.colorScheme.primary,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: themeData.colorScheme.primary
                                        .withOpacity(0.5),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: themeData.colorScheme.primary,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Pilih Surat:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 8.0),

                            if (filteredSurahList.isEmpty) ...[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Tidak ada surat yang ditemukan',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ] else ...[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: themeData.colorScheme.primary
                                        .withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: DropdownButtonFormField<String>(
                                  items:
                                      filteredSurahList
                                          .map(
                                            (surah) => DropdownMenuItem<String>(
                                              value: surah['name'] as String,
                                              child: Text(
                                                '${surah['number']}. ${surah['displayName'] ?? surah['name']} (${surah['verses']} Ayat)',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        selectedSurah = surahList.firstWhere(
                                          (surah) => surah['name'] == value,
                                          orElse: () => surahList.first,
                                        );
                                        _bookmarkedVerses = {};
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor:
                                        _isDarkMode
                                            ? Colors.grey.shade700
                                            : Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 12.0,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: themeData.colorScheme.primary,
                                  ),
                                  isExpanded: true,
                                  hint: Text(
                                    'Pilih surat...',
                                    style: TextStyle(color: secondaryTextColor),
                                  ),
                                ),
                              ),
                            ],

                            const SizedBox(height: 16.0),
                            if (selectedSurah != null) ...[
                              Row(
                                children: [
                                  Icon(
                                    Icons.book,
                                    color: themeData.colorScheme.primary,
                                    size: 28,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Surah ${selectedSurah!['displayName'] ?? selectedSurah!['name']}',
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                            color: textColor,
                                          ),
                                        ),
                                        Text(
                                          '${selectedSurah!['verses']} ayat',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: secondaryTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (_bookmarkedVerses.isNotEmpty)
                                    Text(
                                      '${_bookmarkedVerses.length} ayat ditandai',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 16.0),
                              Divider(
                                color: themeData.colorScheme.primary
                                    .withOpacity(0.5),
                                thickness: 1.0,
                              ),
                              const SizedBox(height: 16.0),
                              if (selectedSurah!['ayahs'] is List) ...[
                                for (
                                  var i = 0;
                                  i < selectedSurah!['ayahs'].length;
                                  i++
                                ) ...[
                                  const SizedBox(height: 8.0),
                                  Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      side: BorderSide(
                                        color:
                                            _bookmarkedVerses.contains(i)
                                                ? Colors.amber
                                                : themeData.colorScheme.primary
                                                    .withOpacity(0.3),
                                        width:
                                            _bookmarkedVerses.contains(i)
                                                ? 2
                                                : 1,
                                      ),
                                    ),
                                    color: cardColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 36,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                  color:
                                                      _bookmarkedVerses
                                                              .contains(i)
                                                          ? Colors.amber
                                                          : themeData
                                                              .colorScheme
                                                              .primary,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '${i + 1}',
                                                    style: const TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: Divider(
                                                  color:
                                                      _bookmarkedVerses
                                                              .contains(i)
                                                          ? Colors.amber
                                                          : themeData
                                                              .colorScheme
                                                              .primary,
                                                  thickness: 1,
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  _bookmarkedVerses.contains(i)
                                                      ? Icons.bookmark
                                                      : Icons.bookmark_border,
                                                  color:
                                                      _bookmarkedVerses
                                                              .contains(i)
                                                          ? Colors.amber
                                                          : secondaryTextColor,
                                                ),
                                                onPressed:
                                                    () => _toggleBookmark(i),
                                                tooltip:
                                                    _bookmarkedVerses.contains(
                                                          i,
                                                        )
                                                        ? 'Hapus bookmark'
                                                        : 'Tandai ayat',
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16.0),
                                          GestureDetector(
                                            onDoubleTap: _toggleArabicTextSize,
                                            child: Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    _isDarkMode
                                                        ? Colors.black38
                                                        : Colors
                                                            .deepPurple
                                                            .shade50
                                                            .withOpacity(0.7),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border:
                                                    _bookmarkedVerses.contains(
                                                          i,
                                                        )
                                                        ? Border.all(
                                                          color: Colors.amber,
                                                          width: 1,
                                                        )
                                                        : null,
                                              ),
                                              child: Text(
                                                selectedSurah!['ayahs'][i]['arabic'] ??
                                                    '',
                                                style: TextStyle(
                                                  fontSize:
                                                      _isArabicTextEnlarged
                                                          ? 32.0
                                                          : 20.0,
                                                  fontFamily: 'Amiri',
                                                  fontWeight: FontWeight.bold,
                                                  color: textColor,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12.0),
                                          Text(
                                            selectedSurah!['ayahs'][i]['transliteration'] ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontStyle: FontStyle.italic,
                                              color: textColor,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                          const SizedBox(height: 8.0),
                                          Text(
                                            selectedSurah!['ayahs'][i]['indonesian'] ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: textColor,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                          const SizedBox(height: 8.0),
                                          Text(
                                            selectedSurah!['ayahs'][i]['english'] ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: secondaryTextColor,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                ],
                              ] else ...[
                                Center(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                        size: 48,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        'Tidak ada ayat untuk surat ini.',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        floatingActionButton:
            _scrollController.hasClients
                ? FloatingActionButton(
                  onPressed: _scrollToTop,
                  backgroundColor: themeData.colorScheme.primary,
                  child: const Icon(Icons.arrow_upward),
                  tooltip: 'Kembali ke atas',
                )
                : null,
      ),
    );
  }
}
