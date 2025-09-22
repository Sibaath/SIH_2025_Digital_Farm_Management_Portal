// import 'package:flutter/material.dart';
// import 'package:frontend/pages/heatmap_page.dart';
// import 'dashboard_page.dart'; // We will create this page next
// import 'daily_scan_page.dart'; // And this one after that
// import 'contacts_page.dart'; // And this one too

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   // A list of the pages to be displayed in the body of the Scaffold
//   static const List<Widget> _widgetOptions = <Widget>[
//     DashboardPage(),
//     DailyScanPage(),
//     ContactsPage(),
//   ];

//   // This function is called when a user taps a navigation bar item
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AgriGuard'),
//         backgroundColor: Colors.green,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications),
//             onPressed: () {
//               // TODO: Navigate to notifications page
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               // TODO: Implement logout functionality
//               // For now, let's just go back to the welcome page
//               Navigator.popUntil(context, (route) => route.isFirst);
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard),
//             label: 'Dashboard',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.camera_alt),
//             label: 'Daily Scan',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.people),
//             label: 'Contacts',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.green,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'daily_scan_page.dart';
import 'contacts_page.dart';
import 'heatmap_page.dart'; // Import the new page

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
    HeatmapPage(), // Add the new page here
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
            icon: Icon(Icons.map),
            label: 'Heatmap', // Add the new label for the heatmap page
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