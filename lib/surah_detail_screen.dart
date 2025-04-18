import 'package:flutter/material.dart';

class SurahDetailScreen extends StatefulWidget {
  final String surahName;
  final List<dynamic> ayahs;

  const SurahDetailScreen({
    super.key,
    required this.surahName,
    required this.ayahs,
  });

  @override
  _SurahDetailScreenState createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  bool _isArabicTextEnlarged = false;

  String _convertToArabicNumber(int number) {
    const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number
        .toString()
        .split('')
        .map((digit) => arabicNumbers[int.parse(digit)])
        .join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surahName),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Arabic Text:',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12.0),
            GestureDetector(
              onDoubleTap: () {
                setState(() {
                  _isArabicTextEnlarged = !_isArabicTextEnlarged;
                });
              },
              child: Text(
                widget.ayahs
                    .map(
                      (ayah) =>
                          '${ayah['arabic']} ﴿${_convertToArabicNumber(ayah['no_ayah'])}﴾',
                    )
                    .join(' '),
                style: TextStyle(
                  fontSize: _isArabicTextEnlarged ? 28.0 : 20.0,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 24.0),
            const Divider(thickness: 2.0),
            const SizedBox(height: 16.0),
            const Text(
              'Ayah Details:',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12.0),
            for (var ayah in widget.ayahs) ...[
              const SizedBox(height: 16.0),
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
                      '${ayah['arabic']} ﴿${_convertToArabicNumber(ayah['no_ayah'])}﴾',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      ayah['transliteration'] ?? '',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      ayah['indonesian'] ?? '',
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      ayah['english'] ?? '',
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
