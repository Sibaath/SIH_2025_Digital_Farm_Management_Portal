import 'package:flutter/material.dart';

class DailyScanPage extends StatelessWidget {
  const DailyScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt, size: 80, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'Daily Biosecurity Scan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Answer a few questions about your farm to help prevent diseases. ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),
            // TODO: Implement a questionnaire or interactive form here
            // This is where the questions you asked for would be displayed
            LinearProgressIndicator(value: 0.1, color: Colors.green),
            SizedBox(height: 10),
            Text('Scan Progress: 10%'),
          ],
        ),
      ),
    );
  }
}