import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en', 'US');

  Locale get currentLocale => _currentLocale;

  static const List<LanguageModel> supportedLanguages = [
    LanguageModel(code: 'en', name: 'English', locale: Locale('en', 'US')),
    LanguageModel(code: 'hi', name: 'हिंदी', locale: Locale('hi', 'IN')),
    LanguageModel(code: 'mr', name: 'मराठी', locale: Locale('mr', 'IN')),
    LanguageModel(code: 'gu', name: 'ગુજરાતી', locale: Locale('gu', 'IN')),
  ];

  void changeLanguage(Locale locale) {
    if (_currentLocale != locale) {
      _currentLocale = locale;
      notifyListeners();
    }
  }

  void toggleLanguage() {
    int currentIndex = supportedLanguages.indexWhere(
      (lang) => lang.locale == _currentLocale,
    );

    // Toggle between English and Hindi (first two languages)
    if (currentIndex == 0) {
      changeLanguage(supportedLanguages[1].locale); // Switch to Hindi
    } else {
      changeLanguage(supportedLanguages[0].locale); // Switch to English
    }
  }

  void setLanguageByCode(String code) {
    final language = supportedLanguages.firstWhere(
      (lang) => lang.code == code,
      orElse: () => supportedLanguages[0],
    );
    changeLanguage(language.locale);
  }

  LanguageModel get currentLanguage {
    return supportedLanguages.firstWhere(
      (lang) => lang.locale == _currentLocale,
      orElse: () => supportedLanguages[0],
    );
  }

  String get currentLanguageName => currentLanguage.name;
  IconData get currentLanguageIcon => Icons.language;
}

class LanguageModel {
  final String code;
  final String name;
  final Locale locale;

  const LanguageModel({
    required this.code,
    required this.name,
    required this.locale,
  });
}
