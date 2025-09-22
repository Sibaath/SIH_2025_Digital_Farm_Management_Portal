import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> with SingleTickerProviderStateMixin {
  late AnimationController _checkAnimationController;

  // Dummy data for today's report
  final String todayHealthStatus = "Good. All metrics are within the normal range.";
  final String todayPossibleDiseases = "No diseases detected.";
  final String todayRemedies = "Maintain current biosecurity practices. Ensure clean water and adequate ventilation.";

  // Dummy data for the last 5 days
  final List<Map<String, dynamic>> previousDaysData = const [
    {"date": "Sept 15, 2025", "status": "Minor Risk", "note": "Minor drop in feed intake. Consulted vet.", "color": Colors.orange},
    {"date": "Sept 14, 2025", "status": "Secure", "note": "No issues detected. High productivity.", "color": Colors.green},
    {"date": "Sept 13, 2025", "status": "Secure", "note": "All systems nominal.", "color": Colors.green},
    {"date": "Sept 12, 2025", "status": "Secure", "note": "No issues. Followed all protocols.", "color": Colors.green},
    {"date": "Sept 11, 2025", "status": "Moderate Risk", "note": "One animal showed signs of illness. Isolated.", "color": Colors.red},
  ];

  @override
  void initState() {
    super.initState();
    _checkAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _checkAnimationController.forward();
  }

  @override
  void dispose() {
    _checkAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Report'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // "GPay Paid" Style Animated Header
            _buildAnimatedHeader(),
            const SizedBox(height: 30),

            // Today's Summary
            const Text(
              "Today's Report",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _buildReportCard("Health Status:", todayHealthStatus, Icons.favorite, Colors.green),
            _buildReportCard("Possible Diseases:", todayPossibleDiseases, Icons.warning, Colors.orange),
            _buildReportCard("Remedies:", todayRemedies, Icons.medical_services, Colors.blue),
            const SizedBox(height: 30),

            // Previous Days' Data
            const Text(
              "Previous 5 Days",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ...previousDaysData.map((data) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: _buildPreviousDayCard(data),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedHeader() {
    return Column(
      children: [
        ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: _checkAnimationController,
            curve: Curves.elasticOut,
          )),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.shade50,
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                ),
              ],
            ),
            child: const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 80,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Report Submitted Successfully!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildReportCard(String title, String content, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviousDayCard(Map<String, dynamic> data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(
          Icons.circle,
          color: data['color'],
          size: 16,
        ),
        title: Text(
          data['date'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text("Status: ${data['status']}"),
            Text("Note: ${data['note']}"),
          ],
        ),
      ),
    );
  }
} 