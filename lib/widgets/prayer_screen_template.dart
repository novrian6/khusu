import 'package:flutter/material.dart';
import '../models/prayer.dart';
import 'prayer_image.dart';

class PrayerScreenTemplate extends StatelessWidget {
  final String title;
  final String? imagePath;
  final List<String>? imagePaths;
  final Prayer prayer;
  final String explanation;
  final String explanationTitle;
  final bool useCarousel;
  final Duration autoPlayInterval;

  const PrayerScreenTemplate({
    super.key,
    required this.title,
    this.imagePath,
    this.imagePaths,
    required this.prayer,
    required this.explanation,
    this.explanationTitle = 'Tentang',
    this.useCarousel = false,
    this.autoPlayInterval = const Duration(seconds: 3),
  }) : assert(
         (imagePath != null && !useCarousel) ||
             (imagePaths != null && useCarousel),
         'Either provide imagePath for single image or imagePaths for carousel',
       );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Explanation card
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepPurple.shade100),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$explanationTitle $title',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    explanation,
                    style: const TextStyle(
                      fontSize: 14.0,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // Image or Carousel
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child:
                  useCarousel
                      ? _buildCarousel()
                      : PrayerImage(
                        imagePath: imagePath!,
                        width: 380,
                        height: 380,
                      ),
            ),

            // Prayer text container
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    prayer.arabicText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 36.0,
                      fontFamily: 'Arabic',
                      height: 1.5,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    'Transliteration',
                    prayer.transliteration,
                    Colors.black87,
                    20.0,
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    'Arti',
                    prayer.indonesianTranslation,
                    Colors.black54,
                    16.0,
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    'Meaning',
                    prayer.englishTranslation,
                    Colors.black54,
                    16.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return SizedBox(
      height: 380,
      child: PageView.builder(
        itemCount: imagePaths!.length,
        controller: PageController(viewportFraction: 0.9),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: PrayerImage(
              imagePath: imagePaths![index],
              width: 380,
              height: 380,
            ),
          );
        },
      ),
    );
  }

  Widget _buildSection(
    String title,
    String content,
    Color textColor,
    double fontSize,
  ) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize, color: textColor, height: 1.5),
        ),
      ],
    );
  }
}
