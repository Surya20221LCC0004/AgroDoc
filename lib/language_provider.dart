import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = Locale('en'); // Default to English

  // Getter for the current locale
  Locale get locale => _currentLocale;

  // Method to change the locale
  void changeLanguage(String languageCode) {
    _currentLocale = Locale(languageCode);
    notifyListeners(); // Notify widgets to rebuild with the new locale
  }
}
