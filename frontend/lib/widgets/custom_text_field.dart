// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final IconData icon;
//   final bool isPassword;
//   final TextInputType keyboardType;
//   final bool enabled;
//   final String? Function(String?)? validator;
//   final Widget? suffixIcon; // Add this line

//   const CustomTextField({
//     super.key,
//     required this.controller,
//     required this.labelText,
//     required this.icon,
//     this.isPassword = false,
//     this.keyboardType = TextInputType.text,
//     this.enabled = true,
//     this.validator,
//     this.suffixIcon, // Add this line
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: isPassword,
//       keyboardType: keyboardType,
//       enabled: enabled,
//       validator: validator,
//       decoration: InputDecoration(
//         labelText: labelText,
//         prefixIcon: Icon(icon, color: Colors.green),
//         suffixIcon: suffixIcon, // Add this line
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.green),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Colors.green.shade200),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.green, width: 2),
//         ),
//         filled: true,
//         fillColor: Colors.green.shade50,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;
  final bool enabled;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final VoidCallback? onTap; // Add this line

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.validator,
    this.suffixIcon,
    this.onTap, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      enabled: enabled,
      validator: validator,
      onTap: onTap, // Add this line
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.green),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.green.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
        filled: true,
        fillColor: Colors.green.shade50,
      ),
    );
  }
}