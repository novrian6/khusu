class MatsuratContent {
  final String title;
  final String description;
  final List<MatsuratItem> content;

  MatsuratContent({
    required this.title,
    required this.description,
    required this.content,
  });

  factory MatsuratContent.fromJson(Map<String, dynamic> json) {
    return MatsuratContent(
      title: json['title'],
      description: json['description'],
      content: List<MatsuratItem>.from(
        json['content'].map((item) => MatsuratItem.fromJson(item)),
      ),
    );
  }
}

class MatsuratItem {
  final String arabic;
  final String transliteration;
  final String translationBahasa;
  final String translationEnglish;
  final String reference;
  final int frequency;

  MatsuratItem({
    required this.arabic,
    required this.transliteration,
    required this.translationBahasa,
    required this.translationEnglish,
    required this.reference,
    required this.frequency,
  });

  factory MatsuratItem.fromJson(Map<String, dynamic> json) {
    return MatsuratItem(
      arabic: json['arabic'],
      transliteration: json['transliteration'],
      translationBahasa: json['translation_bahasa'],
      translationEnglish: json['translation_english'],
      reference: json['reference'],
      frequency: json['frequency'] ?? 1,
    );
  }

  // Convert to the format used in DzikirScreen
  Map<String, String?> toDzikirMap() {
    return {
      'arabic': arabic,
      'transliteration': transliteration,
      'indonesian': translationBahasa,
      'english': translationEnglish,
      'reference': reference,
      'count': frequency > 1 ? '${frequency}x' : null,
    };
  }
}
