// // // import 'package:flutter/material.dart';
// // // import 'daily_scan_page.dart'; // Import the DailyScanPage

// // // // A data model for a farm compartment
// // // class Compartment {
// // //   final String animalType;
// // //   final int maleCount;
// // //   final int femaleCount;
// // //   final String note;
// // //   final IconData icon;
// // //   final Color color;

// // //   Compartment({
// // //     required this.animalType,
// // //     required this.maleCount,
// // //     required this.femaleCount,
// // //     required this.note,
// // //     required this.icon,
// // //     required this.color,
// // //   });
// // // }

// // // class DashboardPage extends StatefulWidget {
// // //   const DashboardPage({super.key});

// // //   @override
// // //   _DashboardPageState createState() => _DashboardPageState();
// // // }

// // // class _DashboardPageState extends State<DashboardPage> {
// // //   // Dummy data for initial compartments
// // //   final List<Compartment> _compartments = [
// // //     Compartment(
// // //       animalType: 'Poultry',
// // //       maleCount: 15,
// // //       femaleCount: 85,
// // //       note: 'Layer hens and broiler chickens.',
// // //       icon: Icons.egg,
// // //       color: Colors.amber,
// // //     ),
// // //     Compartment(
// // //       animalType: 'Pig',
// // //       maleCount: 10,
// // //       femaleCount: 30,
// // //       note: 'Growing pigs for market.',
// // //       icon: Icons.pets,
// // //       color: Colors.pink,
// // //     ),
// // //   ];

// // //   void _addCompartment() {
// // //     // For a prototype, we'll simply add a new dummy compartment
// // //     final newCompartment = Compartment(
// // //       animalType: 'Cow',
// // //       maleCount: 5,
// // //       femaleCount: 15,
// // //       note: 'Dairy cows.',
// // //       icon: Icons.pets,
// // //       color: Colors.brown,
// // //     );

// // //     setState(() {
// // //       _compartments.add(newCompartment);
// // //     });

// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       const SnackBar(content: Text('New compartment added!')),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             const Text(
// // //               'Welcome, Farmer!',
// // //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // //             ),
// // //             const SizedBox(height: 10),
// // //             const Text(
// // //               'Your farm at a glance.',
// // //               style: TextStyle(fontSize: 16, color: Colors.grey),
// // //             ),
// // //             const SizedBox(height: 20),
// // //             _buildInfoCard(
// // //               'Health Score',
// // //               '85%',
// // //               Icons.favorite,
// // //               Colors.green,
// // //             ),
// // //             const SizedBox(height: 16),
// // //             _buildInfoCard(
// // //               'Daily Scans Completed',
// // //               '7/7 Days',
// // //               Icons.check_circle,
// // //               Colors.blue,
// // //             ),
// // //             const SizedBox(height: 16),
// // //             _buildInfoCard(
// // //               'Recent Alerts',
// // //               'No new alerts',
// // //               Icons.warning,
// // //               Colors.orange,
// // //             ),
// // //             const SizedBox(height: 24),
// // //             const Text(
// // //               'Quick Actions',
// // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // //             ),
// // //             const SizedBox(height: 16),
// // //             _buildQuickActionButton(
// // //               context,
// // //               'Perform Daily Scan',
// // //               Icons.camera_alt,
// // //               Colors.lightGreen,
// // //               () {
// // //                 Navigator.push(
// // //                   context,
// // //                   MaterialPageRoute(builder: (context) => const DailyScanPage()),
// // //                 );
// // //               },
// // //             ),
// // //             const SizedBox(height: 12),
// // //             _buildQuickActionButton(
// // //               context,
// // //               'View Biosecurity Guidelines',
// // //               Icons.book,
// // //               Colors.teal,
// // //               () {
// // //                 ScaffoldMessenger.of(context).showSnackBar(
// // //                   const SnackBar(content: Text('Tapped on View Biosecurity Guidelines')),
// // //                 );
// // //               },
// // //             ),
// // //             const SizedBox(height: 24),
// // //             const Text(
// // //               'Farm Compartments',
// // //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // //             ),
// // //             const SizedBox(height: 16),
// // //             _buildCompartmentList(),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _addCompartment,
// // //         backgroundColor: Colors.green,
// // //         child: const Icon(Icons.add),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildInfoCard(String title, String value, IconData icon, Color color) {
// // //     return Card(
// // //       elevation: 4,
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Row(
// // //           children: [
// // //             Icon(icon, size: 40, color: color),
// // //             const SizedBox(width: 16),
// // //             Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text(
// // //                   title,
// // //                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // //                 ),
// // //                 const SizedBox(height: 4),
// // //                 Text(
// // //                   value,
// // //                   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // //                 ),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildQuickActionButton(BuildContext context, String title, IconData icon, Color color, VoidCallback onPressed) {
// // //     return ElevatedButton.icon(
// // //       onPressed: onPressed,
// // //       icon: Icon(icon),
// // //       label: Text(title),
// // //       style: ElevatedButton.styleFrom(
// // //         foregroundColor: Colors.white,
// // //         backgroundColor: color,
// // //         minimumSize: const Size.fromHeight(50),
// // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //         elevation: 3,
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildCompartmentList() {
// // //     return ListView.builder(
// // //       shrinkWrap: true,
// // //       physics: const NeverScrollableScrollPhysics(),
// // //       itemCount: _compartments.length,
// // //       itemBuilder: (context, index) {
// // //         final compartment = _compartments[index];
// // //         return _buildCompartmentCard(compartment);
// // //       },
// // //     );
// // //   }

// // //   Widget _buildCompartmentCard(Compartment compartment) {
// // //     return Card(
// // //       elevation: 4,
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //       margin: const EdgeInsets.only(bottom: 16),
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 Row(
// // //                   children: [
// // //                     Icon(compartment.icon, size: 24, color: compartment.color),
// // //                     const SizedBox(width: 8),
// // //                     Text(
// // //                       compartment.animalType,
// // //                       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 TextButton(
// // //                   onPressed: () {
// // //                     // TODO: Implement navigation to a detailed compartment page
// // //                   },
// // //                   child: const Text('View Details'),
// // //                 ),
// // //               ],
// // //             ),
// // //             const SizedBox(height: 8),
// // //             const Divider(),
// // //             const SizedBox(height: 8),
// // //             Row(
// // //               children: [
// // //                 const Icon(Icons.male, size: 20),
// // //                 const SizedBox(width: 8),
// // //                 Text('Male: ${compartment.maleCount}'),
// // //                 const SizedBox(width: 20),
// // //                 const Icon(Icons.female, size: 20),
// // //                 const SizedBox(width: 8),
// // //                 Text('Female: ${compartment.femaleCount}'),
// // //               ],
// // //             ),
// // //             const SizedBox(height: 8),
// // //             Text(
// // //               'Note: ${compartment.note}',
// // //               style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }


// // import 'package:flutter/material.dart';
// // import 'daily_scan_page.dart';
// // import 'contacts_page.dart';


// // // A data model for a farm compartment
// // class Compartment {
// //   final String animalType;
// //   final int maleCount;
// //   final int femaleCount;
// //   final String note;
// //   final IconData icon;
// //   final Color color;

// //   Compartment({
// //     required this.animalType,
// //     required this.maleCount,
// //     required this.femaleCount,
// //     required this.note,
// //     required this.icon,
// //     required this.color,
// //   });
// // }

// // class DashboardPage extends StatefulWidget {
// //   const DashboardPage({super.key});

// //   @override
// //   _DashboardPageState createState() => _DashboardPageState();
// // }

// // class _DashboardPageState extends State<DashboardPage> {
// //   // Dummy data for initial compartments
// //   final List<Compartment> _compartments = [
// //     Compartment(
// //       animalType: 'Poultry',
// //       maleCount: 15,
// //       femaleCount: 85,
// //       note: 'Layer hens and broiler chickens.',
// //       icon: Icons.egg,
// //       color: Colors.amber,
// //     ),
// //     Compartment(
// //       animalType: 'Pig',
// //       maleCount: 10,
// //       femaleCount: 30,
// //       note: 'Growing pigs for market.',
// //       icon: Icons.pets,
// //       color: Colors.pink,
// //     ),
// //   ];

// //   void _addCompartment() {
// //     final newCompartment = Compartment(
// //       animalType: 'Cow',
// //       maleCount: 5,
// //       femaleCount: 15,
// //       note: 'Dairy cows.',
// //       icon: Icons.pets,
// //       color: Colors.brown,
// //     );

// //     setState(() {
// //       _compartments.add(newCompartment);
// //     });

// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(content: Text('New compartment added!')),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const Text(
// //               'Welcome, Farmer!',
// //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 10),
// //             const Text(
// //               'Your farm at a glance.',
// //               style: TextStyle(fontSize: 16, color: Colors.grey),
// //             ),
// //             const SizedBox(height: 20),

// //             // 1. Farm Compartments Section
// //             _buildSectionHeader('Farm Compartments'),
// //             _buildCompartmentList(),
// //             const SizedBox(height: 24),

// //             // 2. Statistics Section
// //             _buildSectionHeader('Key Statistics'),
// //             _buildStatisticsSection(),
// //             const SizedBox(height: 24),

// //             // 3. Quick Actions Section
// //             _buildSectionHeader('Quick Actions'),
// //             _buildQuickActionsSection(context),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _addCompartment,
// //         backgroundColor: Colors.green,
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }

// //   Widget _buildSectionHeader(String title) {
// //     return Padding(
// //       padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
// //       child: Text(
// //         title,
// //         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //       ),
// //     );
// //   }

// //   Widget _buildStatisticsSection() {
// //     return Column(
// //       children: [
// //         _buildStatCard(
// //           'Health Score',
// //           '85%',
// //           Icons.favorite,
// //           Colors.green,
// //           isHighlighted: true,
// //         ),
// //         const SizedBox(height: 8),
// //         const Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 8.0),
// //           child: Text(
// //             'The Health Score is calculated based on daily scan compliance, recent alerts, and biosecurity protocols.',
// //             style: TextStyle(fontSize: 12, color: Colors.grey),
// //           ),
// //         ),
// //         const SizedBox(height: 16),
// //         _buildStatCard(
// //           'Daily Scans Completed',
// //           '7/7 Days',
// //           Icons.check_circle,
// //           Colors.blue,
// //         ),
// //         const SizedBox(height: 16),
// //         _buildStatCard(
// //           'Recent Alerts',
// //           'No new alerts',
// //           Icons.warning,
// //           Colors.orange,
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildQuickActionsSection(BuildContext context) {
// //     return Column(
// //       children: [
// //         _buildQuickActionButton(
// //           context,
// //           'Perform Daily Scan',
// //           Icons.camera_alt,
// //           Colors.lightGreen,
// //           () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => const DailyScanPage()),
// //             );
// //           },
// //         ),
// //         const SizedBox(height: 12),
// //         _buildQuickActionButton(
// //           context,
// //           'View Biosecurity Guidelines',
// //           Icons.book,
// //           Colors.teal,
// //           () {
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               const SnackBar(content: Text('Tapped on View Biosecurity Guidelines')),
// //             );
// //           },
// //         ),
// //         const SizedBox(height: 12),
// //         _buildQuickActionButton(
// //           context,
// //           'Find Veterinarians',
// //           Icons.people,
// //           Colors.lightBlue,
// //           () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => const ContactsPage()),
// //             );
// //           },
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildStatCard(String title, String value, IconData icon, Color color, {bool isHighlighted = false}) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: isHighlighted ? const Color.fromARGB(255, 195, 215, 225) : Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         border: isHighlighted ? Border.all(color: color, width: 2) : null,
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.grey.withOpacity(isHighlighted ? 0.4 : 0.2),
// //             spreadRadius: isHighlighted ? 3 : 2,
// //             blurRadius: isHighlighted ? 8 : 4,
// //             offset: const Offset(0, 3),
// //           ),
// //         ],
// //       ),
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Row(
// //           children: [
// //             Icon(icon, size: 40, color: color),
// //             const SizedBox(width: 16),
// //             Expanded(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     title,
// //                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                   ),
// //                   const SizedBox(height: 4),
// //                   Text(
// //                     value,
// //                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildQuickActionButton(BuildContext context, String title, IconData icon, Color color, VoidCallback onPressed) {
// //     return ElevatedButton.icon(
// //       onPressed: onPressed,
// //       icon: Icon(icon),
// //       label: Text(title),
// //       style: ElevatedButton.styleFrom(
// //         foregroundColor: Colors.white,
// //         backgroundColor: color,
// //         minimumSize: const Size.fromHeight(50),
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //         elevation: 3,
// //       ),
// //     );
// //   }

// //   Widget _buildCompartmentList() {
// //     return ListView.builder(
// //       shrinkWrap: true,
// //       physics: const NeverScrollableScrollPhysics(),
// //       itemCount: _compartments.length,
// //       itemBuilder: (context, index) {
// //         final compartment = _compartments[index];
// //         return _buildCompartmentCard(compartment);
// //       },
// //     );
// //   }

// //   Widget _buildCompartmentCard(Compartment compartment) {
// //     return Card(
// //       elevation: 4,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       margin: const EdgeInsets.only(bottom: 16),
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Row(
// //                   children: [
// //                     Icon(compartment.icon, size: 24, color: compartment.color),
// //                     const SizedBox(width: 8),
// //                     Text(
// //                       compartment.animalType,
// //                       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                     ),
// //                   ],
// //                 ),
// //                 TextButton(
// //                   onPressed: () {
// //                     // TODO: Implement navigation to a detailed compartment page
// //                   },
// //                   child: const Text('View Details'),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 8),
// //             const Divider(),
// //             const SizedBox(height: 8),
// //             Row(
// //               children: [
// //                 const Icon(Icons.male, size: 20),
// //                 const SizedBox(width: 8),
// //                 Text('Male: ${compartment.maleCount}'),
// //                 const SizedBox(width: 20),
// //                 const Icon(Icons.female, size: 20),
// //                 const SizedBox(width: 8),
// //                 Text('Female: ${compartment.femaleCount}'),
// //               ],
// //             ),
// //             const SizedBox(height: 8),
// //             Text(
// //               'Note: ${compartment.note}',
// //               style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }



// // import 'package:flutter/material.dart';
// // import 'daily_scan_page.dart';
// // import 'contacts_page.dart';
// // import 'heatmap_page.dart';
// // import 'package:image_picker/image_picker.dart';

// // // A data model for a farm compartment
// // class Compartment {
// //   final String animalType;
// //   final int maleCount;
// //   final int femaleCount;
// //   final String note;
// //   final IconData icon;
// //   final Color color;

// //   Compartment({
// //     required this.animalType,
// //     required this.maleCount,
// //     required this.femaleCount,
// //     required this.note,
// //     required this.icon,
// //     required this.color,
// //   });
// // }

// // class DashboardPage extends StatefulWidget {
// //   const DashboardPage({super.key});

// //   @override
// //   _DashboardPageState createState() => _DashboardPageState();
// // }

// // class _DashboardPageState extends State<DashboardPage> {
// //   final _picker = ImagePicker();

// //   // Dummy data for initial compartments
// //   final List<Compartment> _compartments = [
// //     Compartment(
// //       animalType: 'Poultry',
// //       maleCount: 15,
// //       femaleCount: 85,
// //       note: 'Layer hens and broiler chickens.',
// //       icon: Icons.egg,
// //       color: Colors.amber,
// //     ),
// //     Compartment(
// //       animalType: 'Pig',
// //       maleCount: 10,
// //       femaleCount: 30,
// //       note: 'Growing pigs for market.',
// //       icon: Icons.pets,
// //       color: Colors.pink,
// //     ),
// //   ];

// //   void _addCompartment() {
// //     // Show a dialog for adding a new compartment
// //     _showAddCompartmentDialog();
// //   }

// //   void _showOptionsDialog() {
// //     showModalBottomSheet(
// //       context: context,
// //       backgroundColor: Colors.white,
// //       shape: const RoundedRectangleBorder(
// //         borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
// //       ),
// //       builder: (context) {
// //         return Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               const Text(
// //                 'Add New',
// //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //               ),
// //               const SizedBox(height: 20),
// //               _buildModalButton(
// //                 icon: Icons.add_box,
// //                 text: 'Add New Compartment',
// //                 onPressed: () {
// //                   Navigator.pop(context);
// //                   _showAddCompartmentDialog();
// //                 },
// //               ),
// //               const SizedBox(height: 10),
// //               _buildModalButton(
// //                 icon: Icons.upload_file,
// //                 text: 'Upload Medical Report',
// //                 onPressed: () {
// //                   Navigator.pop(context);
// //                   _uploadMedicalReport();
// //                 },
// //               ),
// //               const SizedBox(height: 10),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   Widget _buildModalButton({required IconData icon, required String text, required VoidCallback onPressed}) {
// //     return ElevatedButton.icon(
// //       onPressed: onPressed,
// //       icon: Icon(icon),
// //       label: Text(text),
// //       style: ElevatedButton.styleFrom(
// //         minimumSize: const Size.fromHeight(50),
// //         backgroundColor: Colors.green,
// //         foregroundColor: Colors.white,
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       ),
// //     );
// //   }

// //   void _showAddCompartmentDialog() {
// //     final TextEditingController typeController = TextEditingController();
// //     final TextEditingController maleCountController = TextEditingController();
// //     final TextEditingController femaleCountController = TextEditingController();
// //     final TextEditingController noteController = TextEditingController();

// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: const Text('Add New Compartment'),
// //           content: SingleChildScrollView(
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 TextField(controller: typeController, decoration: const InputDecoration(labelText: 'Animal Type')),
// //                 TextField(controller: maleCountController, decoration: const InputDecoration(labelText: 'Male Count'), keyboardType: TextInputType.number),
// //                 TextField(controller: femaleCountController, decoration: const InputDecoration(labelText: 'Female Count'), keyboardType: TextInputType.number),
// //                 TextField(controller: noteController, decoration: const InputDecoration(labelText: 'Note')),
// //               ],
// //             ),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () => Navigator.pop(context),
// //               child: const Text('Cancel'),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 final newCompartment = Compartment(
// //                   animalType: typeController.text,
// //                   maleCount: int.tryParse(maleCountController.text) ?? 0,
// //                   femaleCount: int.tryParse(femaleCountController.text) ?? 0,
// //                   note: noteController.text,
// //                   icon: Icons.pets, // Default icon
// //                   color: Colors.blue, // Default color
// //                 );
// //                 setState(() {
// //                   _compartments.add(newCompartment);
// //                 });
// //                 Navigator.pop(context);
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   const SnackBar(content: Text('New compartment added successfully!')),
// //                 );
// //               },
// //               child: const Text('Add'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   Future<void> _uploadMedicalReport() async {
// //     // Simulate a file picker
// //     final XFile? file = await _picker.pickMedia();

// //     if (file != null) {
// //       // Show GPay-style animation and processing message
// //       _showProcessingOverlay();

// //       // Simulate a delay for processing
// //       Future.delayed(const Duration(seconds: 5), () {
// //         Navigator.pop(context); // Dismiss processing overlay
// //         _showGPayAnimation(file.name);
// //       });
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('No file selected.')),
// //       );
// //     }
// //   }

// //   void _showProcessingOverlay() {
// //     showDialog(
// //       context: context,
// //       barrierDismissible: false,
// //       builder: (context) {
// //         return Dialog(
// //           child: Container(
// //             padding: const EdgeInsets.all(24),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 CircularProgressIndicator(color: Colors.green),
// //                 SizedBox(height: 16),
// //                 Text('Processing medical report...', style: TextStyle(fontSize: 16)),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   void _showGPayAnimation(String fileName) {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               Icon(Icons.check_circle_outline, color: Colors.green, size: 80),
// //               SizedBox(height: 16),
// //               Text('Medical Report Submitted!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //               SizedBox(height: 8),
// //               Text('File: $fileName', style: TextStyle(color: Colors.grey)),
// //               SizedBox(height: 16),
// //               Text('A copy of the report has been added to your records and will be sent to your veterinarian for review.', textAlign: TextAlign.center),
// //               SizedBox(height: 24),
// //               ElevatedButton(
// //                 onPressed: () => Navigator.pop(context),
// //                 child: Text('Done'),
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   void _showCompartmentDetailsDialog(Compartment compartment) {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text(
// //             '${compartment.animalType} Compartment Details',
// //             style: const TextStyle(fontWeight: FontWeight.bold),
// //           ),
// //           content: SingleChildScrollView(
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 _buildDetailCard('Likely to be Infected', 'Low', Colors.green),
// //                 _buildDetailCard('Needs Treatment', 'No', Colors.green),
// //                 _buildDetailCard('Compartment Health', 'Stable', Colors.green),
// //                 _buildDetailCard('Biosecurity Score', '95/100', Colors.blue),
// //               ],
// //             ),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () => Navigator.pop(context),
// //               child: const Text('Close'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   Widget _buildDetailCard(String title, String value, Color color) {
// //     return Container(
// //       width: double.infinity,
// //       margin: const EdgeInsets.symmetric(vertical: 8),
// //       padding: const EdgeInsets.all(12),
// //       decoration: BoxDecoration(
// //         color: color.withOpacity(0.1),
// //         borderRadius: BorderRadius.circular(12),
// //         border: Border.all(color: color),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
// //           const SizedBox(height: 4),
// //           Text(value),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildSectionHeader(String title) {
// //     return Padding(
// //       padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
// //       child: Text(
// //         title,
// //         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const Text(
// //               'Welcome, Farmer!',
// //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 10),
// //             const Text(
// //               'Your farm at a glance.',
// //               style: TextStyle(fontSize: 16, color: Colors.grey),
// //             ),
// //             const SizedBox(height: 20),
// //             _buildSectionHeader('Farm Compartments'),
// //             _buildCompartmentList(),
// //             const SizedBox(height: 24),
// //             _buildSectionHeader('Key Statistics'),
// //             _buildStatisticsSection(),
// //             const SizedBox(height: 24),
// //             _buildSectionHeader('Quick Actions'),
// //             _buildQuickActionsSection(context),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _showOptionsDialog,
// //         backgroundColor: Colors.green,
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }

// //   Widget _buildStatisticsSection() {
// //     return Column(
// //       children: [
// //         _buildStatCard(
// //           'Health Score',
// //           '85%',
// //           Icons.favorite,
// //           Colors.green,
// //           isHighlighted: true,
// //         ),
// //         const SizedBox(height: 8),
// //         const Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 8.0),
// //           child: Text(
// //             'The Health Score is calculated based on daily scan compliance, recent alerts, and biosecurity protocols.',
// //             style: TextStyle(fontSize: 12, color: Colors.grey),
// //           ),
// //         ),
// //         const SizedBox(height: 16),
// //         _buildStatCard(
// //           'Daily Scans Completed',
// //           '7/7 Days',
// //           Icons.check_circle,
// //           Colors.blue,
// //         ),
// //         const SizedBox(height: 16),
// //         _buildStatCard(
// //           'Recent Alerts',
// //           'No new alerts',
// //           Icons.warning,
// //           Colors.orange,
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildQuickActionsSection(BuildContext context) {
// //     return Column(
// //       children: [
// //         _buildQuickActionButton(
// //           context,
// //           'Perform Daily Scan',
// //           Icons.camera_alt,
// //           Colors.lightGreen,
// //           () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => const DailyScanPage()),
// //             );
// //           },
// //         ),
// //         const SizedBox(height: 12),
// //         _buildQuickActionButton(
// //           context,
// //           'View Biosecurity Guidelines',
// //           Icons.book,
// //           Colors.teal,
// //           () {
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               const SnackBar(content: Text('Tapped on View Biosecurity Guidelines')),
// //             );
// //           },
// //         ),
// //         const SizedBox(height: 12),
// //         _buildQuickActionButton(
// //           context,
// //           'Find Veterinarians',
// //           Icons.people,
// //           Colors.lightBlue,
// //           () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => const ContactsPage()),
// //             );
// //           },
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildStatCard(String title, String value, IconData icon, Color color, {bool isHighlighted = false}) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: isHighlighted ? const Color.fromARGB(255, 195, 215, 225) : Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         border: isHighlighted ? Border.all(color: color, width: 2) : null,
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.grey.withOpacity(isHighlighted ? 0.4 : 0.2),
// //             spreadRadius: isHighlighted ? 3 : 2,
// //             blurRadius: isHighlighted ? 8 : 4,
// //             offset: const Offset(0, 3),
// //           ),
// //         ],
// //       ),
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Row(
// //           children: [
// //             Icon(icon, size: 40, color: color),
// //             const SizedBox(width: 16),
// //             Expanded(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     title,
// //                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                   ),
// //                   const SizedBox(height: 4),
// //                   Text(
// //                     value,
// //                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildQuickActionButton(BuildContext context, String title, IconData icon, Color color, VoidCallback onPressed) {
// //     return ElevatedButton.icon(
// //       onPressed: onPressed,
// //       icon: Icon(icon),
// //       label: Text(title),
// //       style: ElevatedButton.styleFrom(
// //         foregroundColor: Colors.white,
// //         backgroundColor: color,
// //         minimumSize: const Size.fromHeight(50),
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //         elevation: 3,
// //       ),
// //     );
// //   }

// //   Widget _buildCompartmentList() {
// //     return ListView.builder(
// //       shrinkWrap: true,
// //       physics: const NeverScrollableScrollPhysics(),
// //       itemCount: _compartments.length,
// //       itemBuilder: (context, index) {
// //         final compartment = _compartments[index];
// //         return _buildCompartmentCard(compartment);
// //       },
// //     );
// //   }

// //   Widget _buildCompartmentCard(Compartment compartment) {
// //     return Card(
// //       elevation: 4,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       margin: const EdgeInsets.only(bottom: 16),
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Row(
// //                   children: [
// //                     Icon(compartment.icon, size: 24, color: compartment.color),
// //                     const SizedBox(width: 8),
// //                     Text(
// //                       compartment.animalType,
// //                       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                     ),
// //                   ],
// //                 ),
// //                 TextButton(
// //                   onPressed: () => _showCompartmentDetailsDialog(compartment),
// //                   child: const Text('View Details'),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 8),
// //             const Divider(),
// //             const SizedBox(height: 8),
// //             Row(
// //               children: [
// //                 const Icon(Icons.male, size: 20),
// //                 const SizedBox(width: 8),
// //                 Text('Male: ${compartment.maleCount}'),
// //                 const SizedBox(width: 20),
// //                 const Icon(Icons.female, size: 20),
// //                 const SizedBox(width: 8),
// //                 Text('Female: ${compartment.femaleCount}'),
// //               ],
// //             ),
// //             const SizedBox(height: 8),
// //             Text(
// //               'Note: ${compartment.note}',
// //               style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'daily_scan_page.dart';
// import 'contacts_page.dart';
// import 'package:image_picker/image_picker.dart';

// // A data model for a farm compartment
// class Compartment {
//   final String animalType;
//   final int maleCount;
//   final int femaleCount;
//   final String note;
//   final IconData icon;
//   final Color color;

//   Compartment({
//     required this.animalType,
//     required this.maleCount,
//     required this.femaleCount,
//     required this.note,
//     required this.icon,
//     required this.color,
//   });
// }

// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});

//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   final _picker = ImagePicker();

//   final List<Compartment> _compartments = [
//     Compartment(
//       animalType: 'Poultry',
//       maleCount: 15,
//       femaleCount: 85,
//       note: 'Layer hens and broiler chickens.',
//       icon: Icons.egg,
//       color: Colors.amber,
//     ),
//     Compartment(
//       animalType: 'Pig',
//       maleCount: 10,
//       femaleCount: 30,
//       note: 'Growing pigs for market.',
//       icon: Icons.pets,
//       color: Colors.pink,
//     ),
//   ];

//   void _showOptionsDialog() {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 'Add New',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               _buildModalButton(
//                 icon: Icons.add_box,
//                 text: 'Add New Compartment',
//                 onPressed: () {
//                   Navigator.pop(context);
//                   _showAddCompartmentDialog();
//                 },
//               ),
//               const SizedBox(height: 10),
//               _buildModalButton(
//                 icon: Icons.upload_file,
//                 text: 'Upload Medical Report',
//                 onPressed: () {
//                   Navigator.pop(context);
//                   _uploadMedicalReport();
//                 },
//               ),
//               const SizedBox(height: 10),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildModalButton({required IconData icon, required String text, required VoidCallback onPressed}) {
//     return ElevatedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon),
//       label: Text(text),
//       style: ElevatedButton.styleFrom(
//         minimumSize: const Size.fromHeight(50),
//         backgroundColor: Colors.green,
//         foregroundColor: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//     );
//   }

//   void _showAddCompartmentDialog() {
//     final TextEditingController typeController = TextEditingController();
//     final TextEditingController maleCountController = TextEditingController();
//     final TextEditingController femaleCountController = TextEditingController();
//     final TextEditingController noteController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add New Compartment'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(controller: typeController, decoration: const InputDecoration(labelText: 'Animal Type')),
//                 TextField(controller: maleCountController, decoration: const InputDecoration(labelText: 'Male Count'), keyboardType: TextInputType.number),
//                 TextField(controller: femaleCountController, decoration: const InputDecoration(labelText: 'Female Count'), keyboardType: TextInputType.number),
//                 TextField(controller: noteController, decoration: const InputDecoration(labelText: 'Note')),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 final newCompartment = Compartment(
//                   animalType: typeController.text,
//                   maleCount: int.tryParse(maleCountController.text) ?? 0,
//                   femaleCount: int.tryParse(femaleCountController.text) ?? 0,
//                   note: noteController.text,
//                   icon: Icons.pets,
//                   color: Colors.blue,
//                 );
//                 setState(() {
//                   _compartments.add(newCompartment);
//                 });
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('New compartment added successfully!')),
//                 );
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _uploadMedicalReport() async {
//     final XFile? file = await _picker.pickMedia();
//     if (file != null) {
//       _showGPayAnimation();

//       Future.delayed(const Duration(seconds: 3), () {
//         Navigator.pop(context);
//         _showAIAnalysisOverlay(file.name);
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('No file selected.')),
//       );
//     }
//   }

//   void _showGPayAnimation() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(Icons.check_circle_outline, color: Colors.green, size: 80),
//               SizedBox(height: 16),
//               Text('Medical Report Submitted!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _showAIAnalysisOverlay(String fileName) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         return Dialog(
//           child: Container(
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CircularProgressIndicator(color: Colors.green),
//                 SizedBox(height: 16),
//                 Text('Analyzing Medical Report with AI...', style: TextStyle(fontSize: 16)),
//               ],
//             ),
//           ),
//         );
//       },
//     );

//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.pop(context); // Dismiss AI analysis overlay
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: const Text('AI Analysis Complete', style: TextStyle(fontWeight: FontWeight.bold)),
//             content: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Report Name: Medical_Report.pdf', style: TextStyle(fontWeight: FontWeight.w500)),
//                   SizedBox(height: 10),
//                   Text('**AI Summary:**', style: TextStyle(fontWeight: FontWeight.bold)),
//                   SizedBox(height: 5),
//                   Text('Based on the attached medical report, the AI has identified no significant health issues. The veterinarian’s notes confirm that the livestock are in stable condition with all vital signs within the normal range. It is recommended to continue with the current feeding schedule and biosecurity protocols.'),
//                 ],
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('Done'),
//               ),
//             ],
//           );
//         },
//       );
//     });
//   }

//   void _showCompartmentDetailsDialog(Compartment compartment) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//             '${compartment.animalType} Compartment Details',
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildDetailCard('Likely to be Infected', 'Low', Colors.green),
//                 _buildDetailCard('Needs Treatment', 'No', Colors.green),
//                 _buildDetailCard('Compartment Health', 'Stable', Colors.green),
//                 _buildDetailCard('Biosecurity Score', '95/100', Colors.blue),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildDetailCard(String title, String value, Color color) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: color),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//           const SizedBox(height: 4),
//           Text(value),
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
//       child: Text(
//         title,
//         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Welcome, Farmer!',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               'Your farm at a glance.',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             const SizedBox(height: 20),
//             _buildSectionHeader('Farm Compartments'),
//             _buildCompartmentList(),
//             const SizedBox(height: 24),
//             _buildSectionHeader('Key Statistics'),
//             _buildStatisticsSection(),
//             const SizedBox(height: 24),
//             _buildSectionHeader('Quick Actions'),
//             _buildQuickActionsSection(context),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showOptionsDialog,
//         backgroundColor: Colors.green,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   Widget _buildStatisticsSection() {
//     return Column(
//       children: [
//         _buildStatCard(
//           'Health Score',
//           '85%',
//           Icons.favorite,
//           Colors.green,
//           isHighlighted: true,
//         ),
//         const SizedBox(height: 8),
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8.0),
//           child: Text(
//             'The Health Score is calculated based on daily scan compliance, recent alerts, and biosecurity protocols.',
//             style: TextStyle(fontSize: 12, color: Colors.grey),
//           ),
//         ),
//         const SizedBox(height: 16),
//         _buildStatCard(
//           'Daily Scans Completed',
//           '7/7 Days',
//           Icons.check_circle,
//           Colors.blue,
//         ),
//         const SizedBox(height: 16),
//         _buildStatCard(
//           'Recent Alerts',
//           'No new alerts',
//           Icons.warning,
//           Colors.orange,
//         ),
//       ],
//     );
//   }

//   Widget _buildQuickActionsSection(BuildContext context) {
//     return Column(
//       children: [
//         _buildQuickActionButton(
//           context,
//           'Perform Daily Scan',
//           Icons.camera_alt,
//           Colors.lightGreen,
//           () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const DailyScanPage()),
//             );
//           },
//         ),
//         const SizedBox(height: 12),
//         _buildQuickActionButton(
//           context,
//           'View Biosecurity Guidelines',
//           Icons.book,
//           Colors.teal,
//           () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Tapped on View Biosecurity Guidelines')),
//             );
//           },
//         ),
//         const SizedBox(height: 12),
//         _buildQuickActionButton(
//           context,
//           'Find Veterinarians',
//           Icons.people,
//           Colors.lightBlue,
//           () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const ContactsPage()),
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildStatCard(String title, String value, IconData icon, Color color, {bool isHighlighted = false}) {
//     return Container(
//       decoration: BoxDecoration(
//         color: isHighlighted ? const Color.fromARGB(255, 195, 215, 225) : Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: isHighlighted ? Border.all(color: color, width: 2) : null,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(isHighlighted ? 0.4 : 0.2),
//             spreadRadius: isHighlighted ? 3 : 2,
//             blurRadius: isHighlighted ? 8 : 4,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Icon(icon, size: 40, color: color),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     value,
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildQuickActionButton(BuildContext context, String title, IconData icon, Color color, VoidCallback onPressed) {
//     return ElevatedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon),
//       label: Text(title),
//       style: ElevatedButton.styleFrom(
//         foregroundColor: Colors.white,
//         backgroundColor: color,
//         minimumSize: const Size.fromHeight(50),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         elevation: 3,
//       ),
//     );
//   }

//   Widget _buildCompartmentList() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: _compartments.length,
//       itemBuilder: (context, index) {
//         final compartment = _compartments[index];
//         return _buildCompartmentCard(compartment);
//       },
//     );
//   }

//   Widget _buildCompartmentCard(Compartment compartment) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(compartment.icon, size: 24, color: compartment.color),
//                     const SizedBox(width: 8),
//                     Text(
//                       compartment.animalType,
//                       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 TextButton(
//                   onPressed: () => _showCompartmentDetailsDialog(compartment),
//                   child: const Text('View Details'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             const Divider(),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 const Icon(Icons.male, size: 20),
//                 const SizedBox(width: 8),
//                 Text('Male: ${compartment.maleCount}'),
//                 const SizedBox(width: 20),
//                 const Icon(Icons.female, size: 20),
//                 const SizedBox(width: 8),
//                 Text('Female: ${compartment.femaleCount}'),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Note: ${compartment.note}',
//               style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// // A data model for a farm compartment
// class Compartment {
//   final String animalType;
//   final int maleCount;
//   final int femaleCount;
//   final String note;
//   final IconData icon;
//   final Color color;

//   Compartment({
//     required this.animalType,
//     required this.maleCount,
//     required this.femaleCount,
//     required this.note,
//     required this.icon,
//     required this.color,
//   });
// }

// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});

//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   final _picker = ImagePicker();

//   final List<Compartment> _compartments = [
//     Compartment(
//       animalType: 'Poultry',
//       maleCount: 15,
//       femaleCount: 85,
//       note: 'Layer hens and broiler chickens.',
//       icon: Icons.egg,
//       color: Colors.amber,
//     ),
//     Compartment(
//       animalType: 'Pig',
//       maleCount: 10,
//       femaleCount: 30,
//       note: 'Growing pigs for market.',
//       icon: Icons.pets,
//       color: Colors.pink,
//     ),
//   ];

//   void _showOptionsDialog() {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 'Add New',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               _buildModalButton(
//                 icon: Icons.add_box,
//                 text: 'Add New Compartment',
//                 onPressed: () {
//                   Navigator.pop(context);
//                   _showAddCompartmentDialog();
//                 },
//               ),
//               const SizedBox(height: 10),
//               _buildModalButton(
//                 icon: Icons.upload_file,
//                 text: 'Upload Medical Report',
//                 onPressed: () {
//                   Navigator.pop(context);
//                   _uploadMedicalReport();
//                 },
//               ),
//               const SizedBox(height: 10),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildModalButton({required IconData icon, required String text, required VoidCallback onPressed}) {
//     return ElevatedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon),
//       label: Text(text),
//       style: ElevatedButton.styleFrom(
//         minimumSize: const Size.fromHeight(50),
//         backgroundColor: Colors.green,
//         foregroundColor: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//     );
//   }

//   void _showAddCompartmentDialog() {
//     final TextEditingController typeController = TextEditingController();
//     final TextEditingController maleCountController = TextEditingController();
//     final TextEditingController femaleCountController = TextEditingController();
//     final TextEditingController noteController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add New Compartment'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 DropdownButtonFormField<String>(
//                   decoration: const InputDecoration(
//                     labelText: 'Animal Type',
//                     prefixIcon: Icon(Icons.pets, color: Colors.green),
//                   ),
//                   items: const [
//                     DropdownMenuItem(value: 'Poultry', child: Text('Poultry')),
//                     DropdownMenuItem(value: 'Pig', child: Text('Pig')),
//                     DropdownMenuItem(value: 'Cow', child: Text('Cow')),
//                   ],
//                   onChanged: (value) => typeController.text = value ?? '',
//                 ),
//                 TextField(controller: maleCountController, decoration: const InputDecoration(labelText: 'Male Count', prefixIcon: Icon(Icons.male, color: Colors.blue)), keyboardType: TextInputType.number),
//                 TextField(controller: femaleCountController, decoration: const InputDecoration(labelText: 'Female Count', prefixIcon: Icon(Icons.female, color: Colors.pink)), keyboardType: TextInputType.number),
//                 TextField(controller: noteController, decoration: const InputDecoration(labelText: 'Note', prefixIcon: Icon(Icons.notes, color: Colors.grey))),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 final newCompartment = Compartment(
//                   animalType: typeController.text,
//                   maleCount: int.tryParse(maleCountController.text) ?? 0,
//                   femaleCount: int.tryParse(femaleCountController.text) ?? 0,
//                   note: noteController.text,
//                   icon: Icons.pets,
//                   color: Colors.blue,
//                 );
//                 setState(() {
//                   _compartments.add(newCompartment);
//                 });
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('New compartment added successfully!')),
//                 );
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _uploadMedicalReport() async {
//     final XFile? file = await _picker.pickMedia();
//     if (file != null) {
//       // Use the new, combined dialog for the entire process
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => _UploadAndProcessingDialog(
//           fileName: 'Medical_Report.pdf', // Hardcoded for prototype
//           onAnalysisComplete: (analysisText) {
//             _showAIAnalysisDialog(analysisText);
//           },
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('No file selected.')),
//       );
//     }
//   }

//   void _showAIAnalysisDialog(String analysisText) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('AI Analysis Complete', style: TextStyle(fontWeight: FontWeight.bold)),
//           content: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('Report Name: Medical_Report.pdf', style: TextStyle(fontWeight: FontWeight.w500)),
//                 const SizedBox(height: 10),
//                 const Text('AI Summary:', style: TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 5),
//                 Text(analysisText),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Done'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showCompartmentDetailsDialog(Compartment compartment) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//             '${compartment.animalType} Compartment Details',
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildDetailCard('Likely to be Infected', 'Low', Icons.shield, Colors.green),
//                 _buildDetailCard('Needs Treatment', 'No', Icons.local_hospital, Colors.green),
//                 _buildDetailCard('Compartment Health', 'Stable', Icons.favorite, Colors.green),
//                 _buildDetailCard('Biosecurity Score', '95/100', Icons.monitor_heart, Colors.blue),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildDetailCard(String title, String value, IconData icon, Color color) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: color),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 24, color: color),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 4),
//                 Text(value),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
//       child: Text(
//         title,
//         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Welcome, Farmer!',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               'Your farm at a glance.',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             const SizedBox(height: 20),
//             _buildSectionHeader('Farm Compartments'),
//             _buildCompartmentList(),
//             const SizedBox(height: 24),
//             _buildSectionHeader('Key Statistics'),
//             _buildStatisticsSection(),
//             const SizedBox(height: 24),
//             _buildSectionHeader('Quick Actions'),
//             _buildQuickActionsSection(context),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showOptionsDialog,
//         backgroundColor: Colors.green,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   Widget _buildStatisticsSection() {
//     return Column(
//       children: [
//         _buildStatCard(
//           'Health Score',
//           '85%',
//           Icons.favorite,
//           Colors.green,
//           isHighlighted: true,
//         ),
//         const SizedBox(height: 8),
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8.0),
//           child: Text(
//             'The Health Score is calculated based on daily scan compliance, recent alerts, and biosecurity protocols.',
//             style: TextStyle(fontSize: 12, color: Colors.grey),
//           ),
//         ),
//         const SizedBox(height: 16),
//         _buildStatCard(
//           'Daily Scans Completed',
//           '7/7 Days',
//           Icons.check_circle,
//           Colors.blue,
//         ),
//         const SizedBox(height: 16),
//         _buildStatCard(
//           'Recent Alerts',
//           'No new alerts',
//           Icons.warning,
//           Colors.orange,
//         ),
//       ],
//     );
//   }

//   Widget _buildQuickActionsSection(BuildContext context) {
//     return Column(
//       children: [
//         // _buildQuickActionButton(
//         //   context,
//         //   'Perform Daily Scan',
//         //   Icons.camera_alt,
//         //   Colors.lightGreen,
//         //   () {
//         //     Navigator.push(
//         //       context,
//         //       MaterialPageRoute(builder: (context) => const DailyScanPage()),
//         //     );
//         //   },
//         // ),
//         const SizedBox(height: 12),
//         _buildQuickActionButton(
//           context,
//           'View Biosecurity Guidelines',
//           Icons.book,
//           Colors.teal,
//           () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Tapped on View Biosecurity Guidelines')),
//             );
//           },
//         ),
//         const SizedBox(height: 12),        // _buildQuickActionButton(
//         //   context,
//         //   'Perform Daily Scan',
//         //   Icons.camera_alt,
//         //   Colors.lightGreen,
//         //   () {
//         //     Navigator.push(
//         //       context,
//         //       MaterialPageRoute(builder: (context) => const DailyScanPage()),
//         //     );
//         //   },
//         // ),
//         // _buildQuickActionButton(
//         //   context,
//         //   'Find Veterinarians',
//         //   Icons.people,
//         //   Colors.lightBlue,
//         //   () {
//         //     Navigator.push(
//         //       context,
//         //       MaterialPageRoute(builder: (context) => const ContactsPage()),
//         //     );
//         //   },
//         // ),
//       ],
//     );
//   }

//   Widget _buildStatCard(String title, String value, IconData icon, Color color, {bool isHighlighted = false}) {
//     return Container(
//       decoration: BoxDecoration(
//         color: isHighlighted ? const Color.fromARGB(255, 195, 215, 225) : Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: isHighlighted ? Border.all(color: color, width: 2) : null,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(isHighlighted ? 0.4 : 0.2),
//             spreadRadius: isHighlighted ? 3 : 2,
//             blurRadius: isHighlighted ? 8 : 4,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Icon(icon, size: 40, color: color),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     value,
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildQuickActionButton(BuildContext context, String title, IconData icon, Color color, VoidCallback onPressed) {
//     return ElevatedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon),
//       label: Text(title),
//       style: ElevatedButton.styleFrom(
//         foregroundColor: Colors.white,
//         backgroundColor: color,
//         minimumSize: const Size.fromHeight(50),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         elevation: 3,
//       ),
//     );
//   }

//   Widget _buildCompartmentList() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: _compartments.length,
//       itemBuilder: (context, index) {
//         final compartment = _compartments[index];
//         return _buildCompartmentCard(compartment);
//       },
//     );
//   }

//   Widget _buildCompartmentCard(Compartment compartment) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(compartment.icon, size: 24, color: compartment.color),
//                     const SizedBox(width: 8),
//                     Text(
//                       compartment.animalType,
//                       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 TextButton(
//                   onPressed: () => _showCompartmentDetailsDialog(compartment),
//                   child: const Text('View Details'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             const Divider(),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 const Icon(Icons.male, size: 20),
//                 const SizedBox(width: 8),
//                 Text('Male: ${compartment.maleCount}'),
//                 const SizedBox(width: 20),
//                 const Icon(Icons.female, size: 20),
//                 const SizedBox(width: 8),
//                 Text('Female: ${compartment.femaleCount}'),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Note: ${compartment.note}',
//               style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Dialog widget for upload and processing
// class _UploadAndProcessingDialog extends StatefulWidget {
//   final String fileName;
//   final void Function(String analysisText) onAnalysisComplete;

//   const _UploadAndProcessingDialog({
//     required this.fileName,
//     required this.onAnalysisComplete,
//   });

//   @override
//   State<_UploadAndProcessingDialog> createState() => _UploadAndProcessingDialogState();
// }

// class _UploadAndProcessingDialogState extends State<_UploadAndProcessingDialog> {
//   bool _submitted = false;
//   bool _processing = false;

//   @override
//   void initState() {
//     super.initState();
//     _startProcess();
//   }

//   void _startProcess() async {
//     await Future.delayed(const Duration(seconds: 2));
//     setState(() {
//       _submitted = true;
//       _processing = true;
//     });
//     await Future.delayed(const Duration(seconds: 3));
//     widget.onAnalysisComplete(
//       'Based on the attached medical report, the AI has identified no significant health issues. The veterinarian’s notes confirm that the livestock are in stable condition with all vital signs within the normal range. It is recommended to continue with the current feeding schedule and biosecurity protocols.'
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_submitted) {
//       return AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.check_circle_outline, color: Colors.green, size: 80),
//             const SizedBox(height: 16),
//             const Text('Medical Report Submitted!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Text('File: ${widget.fileName}', style: const TextStyle(color: Colors.grey)),
//           ],
//         ),
//       );
//     } else if (_processing) {
//       return Dialog(
//         child: Container(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: const [
//               CircularProgressIndicator(color: Colors.green),
//               SizedBox(height: 16),
//               Text('Analyzing Medical Report with AI...', style: TextStyle(fontSize: 16)),
//             ],
//           ),
//         ),
//       );
//     } else {
//       return const SizedBox.shrink();
//     }
//   }
// } 



import 'package:flutter/material.dart';
import 'daily_scan_page.dart';
import 'contacts_page.dart';
import 'package:image_picker/image_picker.dart';

// A data model for a farm compartment
class Compartment {
  final String animalType;
  final int maleCount;
  final int femaleCount;
  final String note;
  final IconData icon;
  final Color color;

  Compartment({
    required this.animalType,
    required this.maleCount,
    required this.femaleCount,
    required this.note,
    required this.icon,
    required this.color,
  });
}

// Dialog widget for upload and processing
class _UploadAndProcessingDialog extends StatefulWidget {
  final String fileName;
  final void Function(String analysisText) onAnalysisComplete;

  const _UploadAndProcessingDialog({
    required this.fileName,
    required this.onAnalysisComplete,
  });

  @override
  State<_UploadAndProcessingDialog> createState() => _UploadAndProcessingDialogState();
}

class _UploadAndProcessingDialogState extends State<_UploadAndProcessingDialog> {
  bool _submitted = false;
  bool _processing = false;

  @override
  void initState() {
    super.initState();
    _startProcess();
  }

  void _startProcess() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _submitted = true;
      _processing = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    widget.onAnalysisComplete(
      'Based on the attached medical report, the AI has identified no significant health issues. The veterinarian’s notes confirm that the livestock are in stable condition with all vital signs within the normal range. It is recommended to continue with the current feeding schedule and biosecurity protocols.'
    );
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_submitted) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle_outline, color: Colors.green, size: 80),
            const SizedBox(height: 16),
            const Text('Medical Report Submitted!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('File: ${widget.fileName}', style: const TextStyle(color: Colors.grey)),
          ],
        ),
      );
    } else if (_processing) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(color: Colors.green),
              SizedBox(height: 16),
              Text('Analyzing Medical Report with AI...', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _picker = ImagePicker();

  final List<Compartment> _compartments = [
    Compartment(
      animalType: 'Poultry',
      maleCount: 15,
      femaleCount: 85,
      note: 'Layer hens and broiler chickens.',
      icon: Icons.egg,
      color: Colors.amber,
    ),
    Compartment(
      animalType: 'Pig',
      maleCount: 10,
      femaleCount: 30,
      note: 'Growing pigs for market.',
      icon: Icons.pets,
      color: Colors.pink,
    ),
  ];

  void _showOptionsDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add New',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildModalButton(
                icon: Icons.add_box,
                text: 'Add New Compartment',
                onPressed: () {
                  Navigator.pop(context);
                  _showAddCompartmentDialog();
                },
              ),
              const SizedBox(height: 10),
              _buildModalButton(
                icon: Icons.upload_file,
                text: 'Upload Medical Report',
                onPressed: () {
                  Navigator.pop(context);
                  _uploadMedicalReport();
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildModalButton({required IconData icon, required String text, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showAddCompartmentDialog() {
    final TextEditingController typeController = TextEditingController();
    final TextEditingController maleCountController = TextEditingController();
    final TextEditingController femaleCountController = TextEditingController();
    final TextEditingController noteController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Compartment'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Animal Type',
                    prefixIcon: Icon(Icons.pets, color: Colors.green),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Poultry', child: Text('Poultry')),
                    DropdownMenuItem(value: 'Pig', child: Text('Pig')),
                    DropdownMenuItem(value: 'Cow', child: Text('Cow')),
                  ],
                  onChanged: (value) => typeController.text = value ?? '',
                ),
                TextField(controller: maleCountController, decoration: const InputDecoration(labelText: 'Male Count', prefixIcon: Icon(Icons.male, color: Colors.blue)), keyboardType: TextInputType.number),
                TextField(controller: femaleCountController, decoration: const InputDecoration(labelText: 'Female Count', prefixIcon: Icon(Icons.female, color: Colors.pink)), keyboardType: TextInputType.number),
                TextField(controller: noteController, decoration: const InputDecoration(labelText: 'Note', prefixIcon: Icon(Icons.notes, color: Colors.grey))),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final newCompartment = Compartment(
                  animalType: typeController.text,
                  maleCount: int.tryParse(maleCountController.text) ?? 0,
                  femaleCount: int.tryParse(femaleCountController.text) ?? 0,
                  note: noteController.text,
                  icon: Icons.pets,
                  color: Colors.blue,
                );
                setState(() {
                  _compartments.add(newCompartment);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('New compartment added successfully!')),
                );
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _uploadMedicalReport() async {
    final XFile? file = await _picker.pickMedia();
    if (file != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => _UploadAndProcessingDialog(
          fileName: 'Medical_Report.pdf',
          onAnalysisComplete: (analysisText) {
            _showAIAnalysisDialog(analysisText);
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file selected.')),
      );
    }
  }

  void _showAIAnalysisDialog(String analysisText) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('AI Analysis Complete', style: TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Report Name: Medical_Report.pdf', style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                const Text('**AI Summary:**', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(analysisText),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  void _showCompartmentDetailsDialog(Compartment compartment) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            '${compartment.animalType} Compartment Details',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDetailCard('Likely to be Infected', 'Low', Icons.shield, Colors.green),
                _buildDetailCard('Needs Treatment', 'No', Icons.local_hospital, Colors.green),
                _buildDetailCard('Compartment Health', 'Stable', Icons.favorite, Colors.green),
                _buildDetailCard('Biosecurity Score', '95/100', Icons.monitor_heart, Colors.blue),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailCard(String title, String value, IconData icon, Color color) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(value),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              'Your farm at a glance.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _buildSectionHeader('Farm Compartments'),
            _buildCompartmentList(),
            const SizedBox(height: 24),
            _buildSectionHeader('Key Statistics'),
            _buildStatisticsSection(),
            const SizedBox(height: 24),
            _buildSectionHeader('Quick Actions'),
            _buildQuickActionsSection(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showOptionsDialog,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return Column(
      children: [
        _buildStatCard(
          'Health Score',
          '85%',
          Icons.favorite,
          Colors.green,
          isHighlighted: true,
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'The Health Score is calculated based on daily scan compliance, recent alerts, and biosecurity protocols.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 16),
        _buildStatCard(
          'Daily Scans Completed',
          '7/7 Days',
          Icons.check_circle,
          Colors.blue,
        ),
        const SizedBox(height: 16),
        _buildStatCard(
          'Recent Alerts',
          'No new alerts',
          Icons.warning,
          Colors.orange,
        ),
      ],
    );
  }

  Widget _buildQuickActionsSection(BuildContext context) {
    return Column(
      children: [
        _buildQuickActionButton(
          context,
          'Perform Daily Scan',
          Icons.camera_alt,
          Colors.lightGreen,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DailyScanPage()),
            );
          },
        ),
        const SizedBox(height: 12),
        _buildQuickActionButton(
          context,
          'View Biosecurity Guidelines',
          Icons.book,
          Colors.teal,
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tapped on View Biosecurity Guidelines')),
            );
          },
        ),
        const SizedBox(height: 12),
        _buildQuickActionButton(
          context,
          'Find Veterinarians',
          Icons.people,
          Colors.lightBlue,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactsPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color, {bool isHighlighted = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isHighlighted ? const Color.fromARGB(255, 195, 215, 225) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isHighlighted ? Border.all(color: color, width: 2) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(isHighlighted ? 0.4 : 0.2),
            spreadRadius: isHighlighted ? 3 : 2,
            blurRadius: isHighlighted ? 8 : 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(BuildContext context, String title, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
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

  Widget _buildCompartmentList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _compartments.length,
      itemBuilder: (context, index) {
        final compartment = _compartments[index];
        return _buildCompartmentCard(compartment);
      },
    );
  }

  Widget _buildCompartmentCard(Compartment compartment) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(compartment.icon, size: 24, color: compartment.color),
                    const SizedBox(width: 8),
                    Text(
                      compartment.animalType,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => _showCompartmentDetailsDialog(compartment),
                  child: const Text('View Details'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.male, size: 20),
                const SizedBox(width: 8),
                Text('Male: ${compartment.maleCount}'),
                const SizedBox(width: 20),
                const Icon(Icons.female, size: 20),
                const SizedBox(width: 8),
                Text('Female: ${compartment.femaleCount}'),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Note: ${compartment.note}',
              style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}