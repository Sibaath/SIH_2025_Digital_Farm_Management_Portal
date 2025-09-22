import 'package:flutter/material.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'login_page.dart';
import 'signup_page.dart';
import '../widgets/custom_button.dart';
import '../widgets/language_dropdown.dart';

class WelcomePage extends StatelessWidget {
  final Function(Locale) onLanguageChanged;

  const WelcomePage({super.key, required this.onLanguageChanged});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          LanguageDropdown(
            currentLocale: Localizations.localeOf(context),
            onLanguageChanged: onLanguageChanged,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/icon.png', height: 250),
            const SizedBox(height: 40),
            Text(
              loc.welcomeTitle,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              loc.welcomeSubtitle,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            CustomButton(
              text: loc.loginButton,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                      onLanguageChanged: onLanguageChanged,
                    ),
                  ),
                );
              },
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage(onLanguageChanged: onLanguageChanged)),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: const BorderSide(color: Colors.green),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                loc.signUp,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
