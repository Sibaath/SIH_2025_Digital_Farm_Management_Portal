import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'daily_scan_page.dart';
import 'contacts_page.dart';
import 'heatmap_page.dart';
import 'chatbot_page.dart';
import 'reportIssue.dart';
import 'newsScreen.dart';
import 'notifications_page.dart'; // Import the new notifications page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    DailyScanPage(),
    ContactsPage(),
    ChatBotPage(),
    NewsScreen(),
    HeatmapPage(),
    ReportIssuePage()
  ];

  final List<Map<String, dynamic>> _drawerItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard},
    {'title': 'Daily Scan', 'icon': Icons.camera_alt},
    {'title': 'Contacts', 'icon': Icons.people},
    {'title': 'Chat', 'icon': Icons.chat_bubble},
    {'title': 'News', 'icon': Icons.newspaper},
    {'title': 'Heatmap', 'icon': Icons.map},
    {'title': 'Report', 'icon': Icons.report_problem}
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgriGuard'),
        backgroundColor: Colors.green,
        elevation: 0,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // CHANGE: Navigate to the NotificationsPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                'Salafaz Sadeesi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              accountEmail: Text(
                'salafaz.sadeesi@example.com',
                style: TextStyle(fontSize: 14),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'SS',
                  style: TextStyle(fontSize: 40, color: Colors.green),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF4CAF50),
              ),
            ),
            ..._drawerItems.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> item = entry.value;
              return Column(
                children: [
                  ListTile(
                    leading: Icon(item['icon']),
                    title: Text(item['title']),
                    selected: _selectedIndex == index,
                    onTap: () {
                      _onItemTapped(index);
                    },
                  ),
                  const Divider(height: 1, color: Colors.grey),
                ],
              );
            }).toList(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Log Out', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}