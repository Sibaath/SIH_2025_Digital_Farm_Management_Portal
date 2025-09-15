import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, size: 80, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'Connect with Experts & Peers',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Find veterinarians, extension workers, and other farmers in your area to share knowledge and get support.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),
            // TODO: Add buttons or lists for connecting with people
            // Example:
            // ElevatedButton.icon(
            //   onPressed: () {},
            //   icon: Icon(Icons.medical_services),
            //   label: Text('Find Nearby Veterinarians'),
            // ),
            // SizedBox(height: 16),
            // ElevatedButton.icon(
            //   onPressed: () {},
            //   icon: Icon(Icons.group),
            //   label: Text('Farmer Network'),
            // ),
          ],
        ),
      ),
    );
  }
}