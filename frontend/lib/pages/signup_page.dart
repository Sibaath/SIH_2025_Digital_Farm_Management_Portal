// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import '../widgets/custom_text_field.dart';
// import '../widgets/custom_button.dart';
// import '../services/auth_service.dart';
// import './homepage.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//   bool _isLoading = false;

//   Future<void> _getLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Location services are disabled.')),
//       );
//       return;
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permissions are denied.')),
//         );
//         return;
//       }
//     }
    
//     if (permission == LocationPermission.deniedForever) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Location permissions are permanently denied. We cannot request permissions.')),
//       );
//       return;
//     }

//     try {
//       Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
//       Placemark place = placemarks[0];
//       _locationController.text = "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Could not get location: $e')),
//       );
//     }
//   }

//   void _signUp() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       final AuthService _authService = AuthService();
//       final response = await _authService.register(
//         _nameController.text,
//         _emailController.text,
//         _passwordController.text,
//         _phoneController.text,
//         _locationController.text,
//       );

//       setState(() {
//         _isLoading = false;
//       });

//       if (response['success']) {
//         // Navigate to home page on success
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const HomePage()),
//         );
//       } else {
//         // Show an error message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(response['message'])),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign Up'),
//         backgroundColor: Colors.green,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Text(
//                 'Create a new Account',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 30),
//               CustomTextField(
//                 controller: _nameController,
//                 labelText: 'Full Name',
//                 icon: Icons.person,
//                 validator: (value) => value == null || value.isEmpty ? 'Please enter your name' : null,
//               ),
//               const SizedBox(height: 20),
//               CustomTextField(
//                 controller: _phoneController,
//                 labelText: 'Phone Number',
//                 icon: Icons.phone,
//                 keyboardType: TextInputType.phone,
//                 validator: (value) => value == null || value.isEmpty ? 'Please enter your phone number' : null,
//               ),
//               const SizedBox(height: 20),
//               CustomTextField(
//                 controller: _emailController,
//                 labelText: 'Email',
//                 icon: Icons.email,
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) => value == null || value.isEmpty || !value.contains('@') ? 'Please enter a valid email' : null,
//               ),
//               const SizedBox(height: 20),
//               CustomTextField(
//                 controller: _passwordController,
//                 labelText: 'Password',
//                 icon: Icons.lock,
//                 isPassword: true,
//                 validator: (value) => value == null || value.length < 6 ? 'Password must be at least 6 characters' : null,
//               ),
//               const SizedBox(height: 20),
//               // Corrected location text field
//               CustomTextField(
//                 controller: _locationController,
//                 labelText: 'Location',
//                 icon: Icons.location_on,
//                 enabled: false,
//                 validator: (value) => value == null || value.isEmpty ? 'Please get your location' : null,
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.my_location, color: Colors.green),
//                   onPressed: _getLocation,
//                 ),
//               ),
//               const SizedBox(height: 30),
//               _isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : CustomButton(
//                       text: 'Sign Up',
//                       onPressed: _signUp,
//                       color: Colors.green,
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import './homepage.dart';
import '../widgets/language_dropdown.dart';
import '../l10n/app_localizations.dart';

class SignUpPage extends StatefulWidget {
  final Function(Locale) onLanguageChanged; 

  const SignUpPage({super.key, required this.onLanguageChanged});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  void _getSimulatedLocation() {
    _locationController.text =
        "Thiagarajar College of Engineering, Thiruppurankundram, Madurai";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.locationFetched),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _signUp() {
    final loc = AppLocalizations.of(context)!;

    if (_formKey.currentState!.validate()) {
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
        SnackBar(
          content: Text(loc.fillRequiredFields),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.signUpTitle),
        backgroundColor: Colors.green,
        actions: [
          LanguageDropdown(
            currentLocale: Localizations.localeOf(context),
            onLanguageChanged: widget.onLanguageChanged,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                loc.createNewAccount,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: _nameController,
                labelText: loc.fullName,
                icon: Icons.person,
                validator: (value) =>
                    value == null || value.isEmpty ? loc.enterName : null,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _phoneController,
                labelText: loc.phoneNumber,
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value == null || value.isEmpty ? loc.enterPhone : null,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _emailController,
                labelText: loc.email,
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value == null || value.isEmpty || !value.contains('@')
                        ? loc.enterValidEmail
                        : null,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _passwordController,
                labelText: loc.password,
                icon: Icons.lock,
                isPassword: true,
                validator: (value) =>
                    value == null || value.length < 6 ? loc.passwordMin6 : null,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _locationController,
                labelText: loc.location,
                icon: Icons.location_on,
                validator: (value) =>
                    value == null || value.isEmpty ? loc.getLocation : null,
                onTap: _getSimulatedLocation,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: loc.signUpButton,
                onPressed: _signUp,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
