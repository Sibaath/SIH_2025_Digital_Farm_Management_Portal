import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HeatmapPage extends StatefulWidget {
  const HeatmapPage({super.key});

  @override
  _HeatmapPageState createState() => _HeatmapPageState();
}

class _HeatmapPageState extends State<HeatmapPage> {
  String _selectedFilter = 'Infection Type';

  final List<String> _filters = [
    'Infection Type',
    'Animal Count (Pigs)',
    'Animal Count (Chickens)',
  ];

  // Dummy data points with locations and risk levels
  final List<Map<String, dynamic>> _riskData = const [
    {'location': LatLng(10.8250, 78.6942), 'risk': 'high', 'type': 'ASF', 'pigs': 50, 'chickens': 10}, // Trichy
    {'location': LatLng(9.9252, 78.1198), 'risk': 'moderate', 'type': 'AI', 'pigs': 5, 'chickens': 100}, // Madurai
    {'location': LatLng(11.0168, 76.9558), 'risk': 'low', 'type': 'ASF', 'pigs': 2, 'chickens': 50}, // Coimbatore
    {'location': LatLng(10.7905, 78.7047), 'risk': 'high', 'type': 'AI', 'pigs': 10, 'chickens': 200}, // Trichy
    {'location': LatLng(12.9716, 77.5946), 'risk': 'moderate', 'type': 'ASF', 'pigs': 30, 'chickens': 20}, // Bengaluru
    {'location': LatLng(13.0827, 80.2707), 'risk': 'high', 'type': 'AI', 'pigs': 0, 'chickens': 500}, // Chennai
  ];

  Color _getRiskColor(String risk) {
    switch (risk) {
      case 'high':
        return Colors.red.withOpacity(0.6);
      case 'moderate':
        return Colors.orange.withOpacity(0.6);
      case 'low':
        return Colors.yellow.withOpacity(0.6);
      default:
        return Colors.blue.withOpacity(0.6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Disease Outbreak Heatmap',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Styled Dropdown for filtering
          _buildStyledDropdown(),
          const SizedBox(height: 20),
          // Interactive Map with Heatmap Markers
          _buildMapContainer(),
          const SizedBox(height: 30),
          // Statistics and Insights Section with a responsive grid
          const Text(
            'Statistics & Insights',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          _buildStatisticsGrid(),
          const SizedBox(height: 30),
          // Information for Admin
          const Text(
            'Information for Admin',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          _buildAdminInfoCard(),
        ],
      ),
    );
  }

  Widget _buildStyledDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.1),
            spreadRadius: 1.5,
            blurRadius: 4,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedFilter,
          icon: const Icon(Icons.filter_list, color: Colors.green),
          isExpanded: true,
          style: const TextStyle(fontSize: 16, color: Colors.black),
          items: _filters.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedFilter = newValue!;
            });
          },
        ),
      ),
    );
  }

  Widget _buildMapContainer() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(10.8250, 78.6942),
            initialZoom: 9.2,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png",
              subdomains: const ['a', 'b', 'c', 'd'],
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: _riskData.map((data) {
                return Marker(
                  point: data['location'],
                  child: Icon(
                    _selectedFilter == 'Infection Type' ? Icons.warning : Icons.pets,
                    color: _getRiskColor(data['risk']),
                    size: (_selectedFilter == 'Animal Count (Pigs)' || _selectedFilter == 'Animal Count (Chickens)')
                        ? (data[_selectedFilter.split('(')[1].split(')')[0].trim().toLowerCase()] > 50 ? 50 : 25)
                        : 25,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildStatCard(
          title: 'Infected Farms',
          value: '12',
          subtitle: '3% of all registered farms',
          icon: Icons.bar_chart,
          chartData: [0.2, 0.4, 0.8, 0.6],
        ),
        _buildStatCard(
          title: 'Most Common Disease',
          value: 'ASF',
          subtitle: 'African Swine Fever',
          icon: Icons.bug_report,
          chartData: [0.8, 0.5, 0.2, 0.1],
        ),
        _buildStatCard(
          title: 'Highest Risk Area',
          value: 'Madurai',
          subtitle: 'Tamil Nadu',
          icon: Icons.location_on,
          chartData: [0.9, 0.7, 0.5, 0.3],
        ),
        _buildStatCard(
          title: 'Avg. Daily Mortality',
          value: '0.5%',
          subtitle: 'Across all farms',
          icon: Icons.monitor_heart,
          chartData: [0.1, 0.2, 0.1, 0.3],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required List<double> chartData,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // This Expanded widget is the key fix
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Icon(icon, color: Colors.green),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          // Simulated Bar Chart
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: chartData.map((e) => _buildBar(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double heightFactor) {
    return Flexible(
      child: Container(
        width: 10,
        height: 60 * heightFactor,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(heightFactor),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildAdminInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red, width: 1.5),
      ),
      child: const Row(
        children: [
          Icon(Icons.warning_amber, color: Colors.red, size: 30),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Biosecurity Breaches:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '2 new cases reported in the last 24 hours. Action required from a veterinary expert to verify the condition',
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}