// import 'package:flutter/material.dart';
// import '../widgets/custom_text_field.dart';
// import '../widgets/custom_button.dart';
// import '../services/auth_service.dart';
// import './homepage.dart'; // Create this page later

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final AuthService _authService = AuthService();
//   bool _isLoading = false;

//   void _login() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final response = await _authService.login(
//       _usernameController.text,
//       _passwordController.text,
//     );

//     setState(() {
//       _isLoading = false;
//     });

//     if (response['success']) {
//       // Navigate to home page on success
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePage()),
//       );
//     } else {
//       // Show an error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(response['message'])),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Sign In to your Account',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 30),
//             CustomTextField(
//               controller: _usernameController,
//               labelText: 'Username',
//               icon: Icons.person,
//             ),
//             const SizedBox(height: 20),
//             CustomTextField(
//               controller: _passwordController,
//               labelText: 'Password',
//               icon: Icons.lock,
//               isPassword: true,
//             ),
//             const SizedBox(height: 30),
//             _isLoading
//                 ? const CircularProgressIndicator()
//                 : CustomButton(
//                     text: 'Login',
//                     onPressed: _login,
//                     color: Colors.green,
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:frontend/l10n/app_localizations.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/language_dropdown.dart';
import './homepage.dart';

import 'package:flutter/material.dart';
import 'homepage.dart';
import '../l10n/app_localizations.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/language_dropdown.dart';

class LoginPage extends StatefulWidget {
  final Function(Locale) onLanguageChanged; 

  const LoginPage({super.key, required this.onLanguageChanged});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final loc = AppLocalizations.of(context)!;

    if (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            onLanguageChanged: widget.onLanguageChanged, 
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.emptyFields)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.loginTitle),
        backgroundColor: Colors.green,
        actions: [
          LanguageDropdown(
            currentLocale: Localizations.localeOf(context),
            onLanguageChanged: widget.onLanguageChanged,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              loc.signInMessage,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              controller: _usernameController,
              labelText: loc.username,
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _passwordController,
              labelText: loc.password,
              icon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: loc.loginButton,
              onPressed: _login,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
