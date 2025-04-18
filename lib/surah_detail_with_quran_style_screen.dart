import 'package:flutter/material.dart';
import 'dart:math' as math;

class SurahDetailWithQuranStyleScreen extends StatefulWidget {
  final String surahName;
  final List<dynamic> ayahs;

  const SurahDetailWithQuranStyleScreen({
    super.key,
    required this.surahName,
    required this.ayahs,
  });

  @override
  _SurahDetailWithQuranStyleScreenState createState() =>
      _SurahDetailWithQuranStyleScreenState();
}

class _SurahDetailWithQuranStyleScreenState
    extends State<SurahDetailWithQuranStyleScreen> {
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
            // Title with decorative elements
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.deepPurple.shade100),
              ),
              child: Column(
                children: [
                  Text(
                    widget.surahName,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${widget.ayahs.length} Ayat",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.deepPurple.shade400,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24.0),

            // Full Arabic text with Quran-style ayah numbers
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        _isArabicTextEnlarged = !_isArabicTextEnlarged;
                      });
                    },
                    child: RichText(
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: _isArabicTextEnlarged ? 32.0 : 24.0,
                          fontFamily: 'Amiri',
                          color: Colors.black87,
                          height: 1.8,
                        ),
                        children: _buildArabicTextWithQuranStyleNumbers(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24.0),
            const Divider(thickness: 2.0),

            // Ayah details
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
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Quran-style ayah number
                        _buildQuranStyleAyahNumber(ayah['no_ayah']),
                        const SizedBox(width: 12),

                        // Ayah content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ayah['arabic'] ?? '',
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  fontFamily: 'Amiri',
                                  height: 1.8,
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                ayah['transliteration'] ?? '',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                ayah['indonesian'] ?? '',
                                style: const TextStyle(fontSize: 16.0),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                ayah['english'] ?? '',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

  // Build a list of TextSpan with Arabic text and decorative ayah numbers
  List<TextSpan> _buildArabicTextWithQuranStyleNumbers() {
    List<TextSpan> spans = [];

    for (var ayah in widget.ayahs) {
      // Add the Arabic text
      spans.add(TextSpan(text: ayah['arabic'] ?? ''));

      // Add the ayah number in decorative style using Unicode characters
      spans.add(
        TextSpan(
          text: " ﴿${_convertToArabicNumber(ayah['no_ayah'])}﴾ ",
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return spans;
  }

  // Create a decorative circle for ayah numbers
  Widget _buildQuranStyleAyahNumber(int number) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: Colors.deepPurple, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: CustomPaint(
        painter: AyahNumberPainter(
          number: _convertToArabicNumber(number),
          color: Colors.deepPurple,
        ),
        size: const Size(40, 40),
      ),
    );
  }
}

// Custom painter for decorative ayah numbers
class AyahNumberPainter extends CustomPainter {
  final String number;
  final Color color;

  AyahNumberPainter({required this.number, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw decorative elements around the circle
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;

    // Draw eight small decorative marks
    for (int i = 0; i < 8; i++) {
      final angle = i * (math.pi / 4);
      final x = center.dx + (radius - 5) * math.cos(angle);
      final y = center.dy + (radius - 5) * math.sin(angle);
      canvas.drawCircle(Offset(x, y), 1, paint);
    }

    // Draw the number text
    final textPainter = TextPainter(
      text: TextSpan(
        text: number,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.rtl,
    );

    textPainter.layout();
    final textX = center.dx - (textPainter.width / 2);
    final textY = center.dy - (textPainter.height / 2);
    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
