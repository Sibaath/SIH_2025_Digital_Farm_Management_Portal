import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  final Locale currentLocale;
  final Function(Locale) onLanguageChanged;

  const LanguageDropdown({
    super.key,
    required this.currentLocale,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: currentLocale,
      icon: const Icon(Icons.language, color: Colors.white),
      underline: const SizedBox(),
      onChanged: (Locale? newLocale) {
        if (newLocale != null) {
          onLanguageChanged(newLocale);
        }
      },
      items: const [
        DropdownMenuItem(value: Locale('en'), child: Text("English")),
        DropdownMenuItem(value: Locale('hi'), child: Text("हिन्दी")),
        DropdownMenuItem(value: Locale('ta'), child: Text("தமிழ்")),
      ],
    );
  }
}
