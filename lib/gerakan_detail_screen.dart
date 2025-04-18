import 'package:flutter/material.dart';

class GerakanDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String? arabicText; // Arabic text
  final String? transliteration; // Transliteration of Arabic text
  final String? indonesianTranslation; // Translation in Indonesian
  final String? englishTranslation; // Translation in English

  const GerakanDetailScreen({
    super.key,
    required this.title,
    required this.description,
    this.arabicText,
    this.transliteration,
    this.indonesianTranslation,
    this.englishTranslation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.deepPurple),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(description, style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 24.0),
            if (arabicText != null) ...[
              const Text(
                'Dalam Bahasa Arab:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(arabicText!, style: const TextStyle(fontSize: 18.0)),
            ],
            if (transliteration != null) ...[
              const SizedBox(height: 16.0),
              const Text(
                'Bacaan dalam Ejaan Arab:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(transliteration!, style: const TextStyle(fontSize: 18.0)),
            ],
            if (indonesianTranslation != null) ...[
              const SizedBox(height: 16.0),
              const Text(
                'Arti Bahasa Indonesia:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                indonesianTranslation!,
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
            if (englishTranslation != null) ...[
              const SizedBox(height: 16.0),
              const Text(
                'Arti Bahasa Inggris:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(englishTranslation!, style: const TextStyle(fontSize: 18.0)),
            ],
          ],
        ),
      ),
    );
  }
}
