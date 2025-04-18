import 'package:flutter/material.dart';

class BacaanGerakanScreen extends StatelessWidget {
  final String title;
  final String description;
  final String? arabicText; // Arabic text
  final String? transliteration; // Transliteration of Arabic text
  final String? indonesianTranslation; // Translation in Indonesian
  final String? englishTranslation; // Translation in English

  const BacaanGerakanScreen({
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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    description,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20.0),

            // Arabic text section
            if (arabicText != null)
              _buildContentCard(
                context: context,
                title: 'Dalam Bahasa Arab',
                content: arabicText!,
                icon: Icons.language,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                textStyle: const TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'Arial',
                  height: 1.8,
                ),
              ),

            if (transliteration != null)
              _buildContentCard(
                context: context,
                title: 'Bacaan dalam Ejaan Arab',
                content: transliteration!,
                icon: Icons.record_voice_over,
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
              ),

            if (indonesianTranslation != null)
              _buildContentCard(
                context: context,
                title: 'Arti Bahasa Indonesia',
                content: indonesianTranslation!,
                icon: Icons.translate,
              ),

            if (englishTranslation != null)
              _buildContentCard(
                context: context,
                title: 'Arti Bahasa Inggris',
                content: englishTranslation!,
                icon: Icons.language,
              ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildContentCard({
    required BuildContext context,
    required String title,
    required String content,
    IconData icon = Icons.text_fields,
    TextAlign textAlign = TextAlign.left,
    TextDirection? textDirection,
    TextStyle? textStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.deepPurple),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  content,
                  style:
                      textStyle ??
                      Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(height: 1.5),
                  textAlign: textAlign,
                  textDirection: textDirection,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
