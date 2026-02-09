/// App-wide constants
class AppConstants {
  // App Info
  static const String appName = 'ThutoHub';
  static const String appVersion = '1.0.0';

  // Supported Languages
  static const List<String> supportedLanguages = [
    'English',
    'Zulu',
    'Xhosa',
    'Afrikaans',
    'Sotho',
    'Tswana',
    'Pedi',
    'Venda',
    'Tsonga',
    'Swati',
    'Ndebele',
  ];

  // Language Codes
  static const Map<String, String> languageCodes = {
    'English': 'en',
    'Zulu': 'zu',
    'Xhosa': 'xh',
    'Afrikaans': 'af',
    'Sotho': 'st',
    'Tswana': 'tn',
    'Pedi': 'nso',
    'Venda': 've',
    'Tsonga': 'ts',
    'Swati': 'ss',
    'Ndebele': 'nr',
  };

  // Subjects
  static const List<String> subjects = [
    'Mathematics',
    'Science',
    'English',
    'Life Skills',
  ];

  // Grade Levels
  static const List<String> gradeLevels = [
    'Grade 1',
    'Grade 2',
    'Grade 3',
    'Grade 4',
    'Grade 5',
    'Grade 6',
    'Grade 7',
  ];

  // API Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 8.0;
}
