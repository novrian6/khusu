import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khusu/bacaan_gerakan_screen.dart';
import 'package:khusu/bacaan_berdiri_screen.dart'; // Import BacaanBerdiriScreen
import 'models/prayer.dart';

class BacaanScreen extends StatefulWidget {
  const BacaanScreen({super.key});

  @override
  State<BacaanScreen> createState() => _BacaanScreenState();
}

class _BacaanScreenState extends State<BacaanScreen> {
  List<Prayer> prayers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadPrayers();
  }

  Future<void> loadPrayers() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/data/prayers.json',
      );
      final data = json.decode(jsonString);
      setState(() {
        prayers =
            (data['prayers'] as List)
                .map((item) => Prayer.fromJson(item))
                .toList();
        isLoading = false;
      });
    } catch (e) {
      print('Error loading prayers: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bacaan Sholat',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple.shade50, Colors.white],
            stops: const [0.0, 0.3],
          ),
        ),
        child:
            isLoading
                ? const Center(
                  child: CircularProgressIndicator(color: Colors.deepPurple),
                )
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Kumpulan bacaan penting dalam sholat',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: prayers.length,
                          itemBuilder: (context, index) {
                            final prayer = prayers[index];
                            return Card(
                              elevation: 2,
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  // Check if the prayer title is "Berdiri Tegak"
                                  if (prayer.title == "Berdiri Tegak") {
                                    // Navigate to BacaanBerdiriScreen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                const BacaanBerdiriScreen(),
                                      ),
                                    );
                                  } else {
                                    // For other prayers, navigate to BacaanGerakanScreen as before
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => BacaanGerakanScreen(
                                              title: prayer.title,
                                              description: prayer.description,
                                              arabicText: prayer.arabicText,
                                              transliteration:
                                                  prayer.transliteration,
                                              indonesianTranslation:
                                                  prayer.indonesianTranslation,
                                              englishTranslation:
                                                  prayer.englishTranslation,
                                            ),
                                      ),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.deepPurple.shade100,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.menu_book,
                                            color: Colors.deepPurple.shade700,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              prayer.title,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepPurple,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              prayer.description,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.deepPurple.shade300,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}

/*class BacaanGerakanScreen extends StatefulWidget {
  final String title;
  final String description;
  final String arabicText;
  final String transliteration;
  final String indonesianTranslation;
  final String englishTranslation;

  const BacaanGerakanScreen({
    super.key,
    required this.title,
    required this.description,
    required this.arabicText,
    required this.transliteration,
    required this.indonesianTranslation,
    required this.englishTranslation,
  });

  @override
  _BacaanGerakanScreenState createState() => _BacaanGerakanScreenState();
}

class _BacaanGerakanScreenState extends State<BacaanGerakanScreen> {
  bool _isArabicTextEnlarged = false;

  void _toggleArabicTextSize() {
    setState(() {
      _isArabicTextEnlarged = !_isArabicTextEnlarged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              Text('Arabic:', style: Theme.of(context).textTheme.titleMedium),
              GestureDetector(
                onDoubleTap: _toggleArabicTextSize,
                child: Text(
                  widget.arabicText.isNotEmpty
                      ? widget.arabicText
                      : 'Teks Arab tidak tersedia.', // Fallback for Arabic text
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: _isArabicTextEnlarged ? 32.0 : 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Transliteration:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                widget.transliteration,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Indonesian Translation:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                widget.indonesianTranslation,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              Text(
                'English Translation:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                widget.englishTranslation,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
