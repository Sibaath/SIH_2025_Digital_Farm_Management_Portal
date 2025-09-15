import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome, Farmer!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Your farm at a glance. ',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          // Placeholder for key metrics
          _buildInfoCard(
            'Health Score',
            '85%',
            Icons.favorite,
            Colors.green,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            'Daily Scans Completed',
            '7/7 Days',
            Icons.check_circle,
            Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            'Recent Alerts',
            'No new alerts',
            Icons.warning,
            Colors.orange,
          ),
          const SizedBox(height: 24),
          // Section for recent activity or a quick link
          const Text(
            'Quick Actions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildQuickActionButton(
            context,
            'Perform Daily Scan',
            Icons.camera_alt,
            Colors.lightGreen,
          ),
          const SizedBox(height: 12),
          _buildQuickActionButton(
            context,
            'View Biosecurity Guidelines',
            Icons.book,
            Colors.teal,
          ),
          // TODO: Add more widgets for charts, maps, and detailed info
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(BuildContext context, String title, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Implement navigation to relevant page
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on $title')),
        );
      },
      icon: Icon(icon),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
      ),
    );
  }
}