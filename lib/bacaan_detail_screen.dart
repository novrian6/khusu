import 'package:flutter/material.dart';

class BacaanDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String arabicText;
  final String transliteration;
  final String indonesianTranslation;
  final String englishTranslation;

  const BacaanDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.arabicText,
    required this.transliteration,
    required this.indonesianTranslation,
    required this.englishTranslation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title.isNotEmpty ? title : 'Detail Bacaan',
        ), // Fallback for title
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Added scroll view for better layout handling
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description.isNotEmpty
                    ? description
                    : 'Deskripsi tidak tersedia.', // Fallback for description
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),
              Text('Arabic:', style: Theme.of(context).textTheme.titleMedium),
              Text(
                arabicText.isNotEmpty
                    ? arabicText
                    : 'Teks Arab tidak tersedia.', // Fallback for Arabic text
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Transliteration:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                transliteration.isNotEmpty
                    ? transliteration
                    : 'Transliterasi tidak tersedia.', // Fallback for transliteration
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Indonesian Translation:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                indonesianTranslation.isNotEmpty
                    ? indonesianTranslation
                    : 'Terjemahan Indonesia tidak tersedia.', // Fallback for Indonesian translation
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              Text(
                'English Translation:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                englishTranslation.isNotEmpty
                    ? englishTranslation
                    : 'English translation not available.', // Fallback for English translation
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
