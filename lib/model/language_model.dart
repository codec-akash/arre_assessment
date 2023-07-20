class Language {
  late String title;
  late String englishTitle;
  late bool isSelected;

  Language({
    required this.title,
    required this.englishTitle,
    this.isSelected = false,
  });

  Language.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    englishTitle = json['titleEnglish'];
  }
}
