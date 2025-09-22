import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'daily_scan_page.dart';
import 'contacts_page.dart';
import 'heatmap_page.dart';
import 'chatbot_page.dart'; // Import the new ChatBotPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // A list of the pages to be displayed in the body of the Scaffold
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    DailyScanPage(),
    ContactsPage(),
    ChatBotPage(), // Add the ChatBotPage here
    HeatmapPage(),
  ];

  // This function is called when a user taps a navigation bar item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgriGuard'),
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Navigate to notifications page
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Implement logout functionality
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Daily Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble), // New icon for the chatbot
            label: 'Chat', // New label for the chatbot page
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Heatmap',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // To show all items clearly
      ),
    );
  }
}