class Prayer {
  final String id;
  final String title;
  final String description;
  final String arabicText;
  final String transliteration;
  final String indonesianTranslation;
  final String englishTranslation;

  Prayer({
    required this.id,
    required this.title,
    required this.description,
    required this.arabicText,
    required this.transliteration,
    required this.indonesianTranslation,
    required this.englishTranslation,
  });

  factory Prayer.fromJson(Map<String, dynamic> json) {
    return Prayer(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      arabicText: json['arabicText'],
      transliteration: json['transliteration'],
      indonesianTranslation: json['indonesianTranslation'],
      englishTranslation: json['englishTranslation'],
    );
  }
}
