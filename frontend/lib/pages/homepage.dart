import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'daily_scan_page.dart';
import 'contacts_page.dart';
import 'heatmap_page.dart';
import '../widgets/language_dropdown.dart'; 

class HomePage extends StatefulWidget {
  final Function(Locale) onLanguageChanged;

  const HomePage({super.key, required this.onLanguageChanged});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      DashboardPage(onLanguageChanged: widget.onLanguageChanged),
      DailyScanPage(),
      ContactsPage(onLanguageChanged: widget.onLanguageChanged),
      HeatmapPage(),
    ];
  }

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
          LanguageDropdown(
            currentLocale: Localizations.localeOf(context),
            onLanguageChanged: widget.onLanguageChanged,
          ),
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
            icon: Icon(Icons.map),
            label: 'Heatmap',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
