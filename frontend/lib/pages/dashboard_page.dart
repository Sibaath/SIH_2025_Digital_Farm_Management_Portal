// // import 'package:flutter/material.dart';
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

// // // Dialog widget for upload and processing
// // class _UploadAndProcessingDialog extends StatefulWidget {
// //   final String fileName;
// //   final void Function(String analysisText) onAnalysisComplete;

// //   const _UploadAndProcessingDialog({
// //     required this.fileName,
// //     required this.onAnalysisComplete,
// //   });

// //   @override
// //   State<_UploadAndProcessingDialog> createState() => _UploadAndProcessingDialogState();
// // }

// // class _UploadAndProcessingDialogState extends State<_UploadAndProcessingDialog> {
// //   bool _submitted = false;
// //   bool _processing = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _startProcess();
// //   }

// //   void _startProcess() async {
// //     await Future.delayed(const Duration(seconds: 2));
// //     setState(() {
// //       _submitted = true;
// //       _processing = true;
// //     });
// //     await Future.delayed(const Duration(seconds: 3));
// //     widget.onAnalysisComplete(
// //       'Based on the attached medical report, the AI has identified no significant health issues. The veterinarian’s notes confirm that the livestock are in stable condition with all vital signs within the normal range. It is recommended to continue with the current feeding schedule and biosecurity protocols.'
// //     );
// //     if (mounted) {
// //       Navigator.of(context).pop();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     if (!_submitted) {
// //       return AlertDialog(
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //         content: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             Icon(Icons.check_circle_outline, color: Colors.green, size: 80),
// //             const SizedBox(height: 16),
// //             const Text('Medical Report Submitted!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //             const SizedBox(height: 8),
// //             Text('File: ${widget.fileName}', style: const TextStyle(color: Colors.grey)),
// //           ],
// //         ),
// //       );
// //     } else if (_processing) {
// //       return Dialog(
// //         child: Container(
// //           padding: const EdgeInsets.all(24),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: const [
// //               CircularProgressIndicator(color: Colors.green),
// //               SizedBox(height: 16),
// //               Text('Analyzing Medical Report with AI...', style: TextStyle(fontSize: 16)),
// //             ],
// //           ),
// //         ),
// //       );
// //     } else {
// //       return const SizedBox.shrink();
// //     }
// //   }
// // }

// // class DashboardPage extends StatefulWidget {
// //   const DashboardPage({super.key});

// //   @override
// //   _DashboardPageState createState() => _DashboardPageState();
// // }

// // class _DashboardPageState extends State<DashboardPage> {
// //   final _picker = ImagePicker();

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
// //                 DropdownButtonFormField<String>(
// //                   decoration: const InputDecoration(
// //                     labelText: 'Animal Type',
// //                     prefixIcon: Icon(Icons.pets, color: Colors.green),
// //                   ),
// //                   items: const [
// //                     DropdownMenuItem(value: 'Poultry', child: Text('Poultry')),
// //                     DropdownMenuItem(value: 'Pig', child: Text('Pig')),
// //                     DropdownMenuItem(value: 'Cow', child: Text('Cow')),
// //                   ],
// //                   onChanged: (value) => typeController.text = value ?? '',
// //                 ),
// //                 TextField(controller: maleCountController, decoration: const InputDecoration(labelText: 'Male Count', prefixIcon: Icon(Icons.male, color: Colors.blue)), keyboardType: TextInputType.number),
// //                 TextField(controller: femaleCountController, decoration: const InputDecoration(labelText: 'Female Count', prefixIcon: Icon(Icons.female, color: Colors.pink)), keyboardType: TextInputType.number),
// //                 TextField(controller: noteController, decoration: const InputDecoration(labelText: 'Note', prefixIcon: Icon(Icons.notes, color: Colors.grey))),
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
// //                   icon: Icons.pets,
// //                   color: Colors.blue,
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
// //     final XFile? file = await _picker.pickMedia();
// //     if (file != null) {
// //       showDialog(
// //         context: context,
// //         barrierDismissible: false,
// //         builder: (context) => _UploadAndProcessingDialog(
// //           fileName: 'Medical_Report.pdf',
// //           onAnalysisComplete: (analysisText) {
// //             _showAIAnalysisDialog(analysisText);
// //           },
// //         ),
// //       );
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('No file selected.')),
// //       );
// //     }
// //   }

// //   void _showAIAnalysisDialog(String analysisText) {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: const Text('AI Analysis Complete', style: TextStyle(fontWeight: FontWeight.bold)),
// //           content: SingleChildScrollView(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 const Text('Report Name: Medical_Report.pdf', style: TextStyle(fontWeight: FontWeight.w500)),
// //                 const SizedBox(height: 10),
// //                 const Text('**AI Summary:**', style: TextStyle(fontWeight: FontWeight.bold)),
// //                 const SizedBox(height: 5),
// //                 Text(analysisText),
// //               ],
// //             ),
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () => Navigator.pop(context),
// //               child: const Text('Done'),
// //             ),
// //           ],
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
// //                 _buildDetailCard('Likely to be Infected', 'Low', Icons.shield, Colors.green),
// //                 _buildDetailCard('Needs Treatment', 'No', Icons.local_hospital, Colors.green),
// //                 _buildDetailCard('Compartment Health', 'Stable', Icons.favorite, Colors.green),
// //                 _buildDetailCard('Biosecurity Score', '95/100', Icons.monitor_heart, Colors.blue),
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

// //   Widget _buildDetailCard(String title, String value, IconData icon, Color color) {
// //     return Container(
// //       width: double.infinity,
// //       margin: const EdgeInsets.symmetric(vertical: 8),
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: color.withOpacity(0.1),
// //         borderRadius: BorderRadius.circular(12),
// //         border: Border.all(color: color),
// //       ),
// //       child: Row(
// //         children: [
// //           Icon(icon, size: 24, color: color),
// //           const SizedBox(width: 12),
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
// //                 const SizedBox(height: 4),
// //                 Text(value),
// //               ],
// //             ),
// //           ),
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
// import 'package:image_picker/image_picker.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'dart:io';

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
//     if (mounted) {
//       Navigator.of(context).pop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_submitted) {
//       return AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.check_circle_outline, color: Colors.green, size: 80),
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
//           child: const Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
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

// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});

//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   final ImagePicker _picker = ImagePicker();

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

//   void _showAddCompartmentDialog() {
//     final TextEditingController typeController = TextEditingController();
//     final TextEditingController maleCountController = TextEditingController();
//     final TextEditingController femaleCountController = TextEditingController();
//     final TextEditingController noteController = TextEditingController();
    
//     File? compartmentPhoto;
//     VideoPlayerController? _videoController;

//     // AI summary mock data
//     String _currentLanguage = 'en';
//     late FlutterTts _flutterTts;
//     bool _isSpeaking = false;
//     String _summaryText = 'The video and image show healthy livestock with normal behavior patterns. No immediate biosecurity risks were identified. It is recommended to maintain the current farm hygiene practices.';
//     String _summaryTextTamil = 'வீடியோ மற்றும் படம் இயல்பான நடத்தை முறைகளுடன் ஆரோக்கியமான கால்நடைகளை காட்டுகின்றன. உடனடி உயிர்பாதுகாப்பு அபாயங்கள் எதுவும் கண்டறியப்படவில்லை. தற்போதைய பண்ணை சுகாதார நடைமுறைகளைத் தொடர பரிந்துரைக்கப்படுகிறது.';

//     void _initializeTts() async {
//       _flutterTts = FlutterTts();
//       await _flutterTts.setLanguage(_currentLanguage == 'ta' ? 'ta-IN' : 'en-US');
//       await _flutterTts.setSpeechRate(0.5);
//       await _flutterTts.setVolume(1.0);
//       await _flutterTts.setPitch(1.0);

//       _flutterTts.setCompletionHandler(() {
//         if (mounted) {
//           setState(() {
//             _isSpeaking = false;
//           });
//         }
//       });
//     }

//     void _speakSummary(String text) async {
//       if (_isSpeaking) {
//         await _flutterTts.stop();
//         setState(() {
//           _isSpeaking = false;
//         });
//         return;
//       }
      
//       setState(() {
//         _isSpeaking = true;
//       });
//       await _flutterTts.speak(text);
//     }
    
//     _initializeTts();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return AlertDialog(
//               title: const Text('Add New Compartment'),
//               content: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     DropdownButtonFormField<String>(
//                       decoration: const InputDecoration(
//                         labelText: 'Animal Type',
//                         prefixIcon: Icon(Icons.pets, color: Colors.green),
//                       ),
//                       items: const [
//                         DropdownMenuItem(value: 'Poultry', child: Text('Poultry')),
//                         DropdownMenuItem(value: 'Pig', child: Text('Pig')),
//                         DropdownMenuItem(value: 'Cow', child: Text('Cow')),
//                       ],
//                       onChanged: (value) => typeController.text = value ?? '',
//                     ),
//                     TextField(controller: maleCountController, decoration: const InputDecoration(labelText: 'Male Count', prefixIcon: Icon(Icons.male, color: Colors.blue)), keyboardType: TextInputType.number),
//                     TextField(controller: femaleCountController, decoration: const InputDecoration(labelText: 'Female Count', prefixIcon: Icon(Icons.female, color: Colors.pink)), keyboardType: TextInputType.number),
//                     TextField(controller: noteController, decoration: const InputDecoration(labelText: 'Note', prefixIcon: Icon(Icons.notes, color: Colors.grey))),
//                     const SizedBox(height: 20),

//                     if (compartmentPhoto == null)
//                       ElevatedButton.icon(
//                         onPressed: () async {
//                           final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
//                           if (photo != null) {
//                             setState(() {
//                               compartmentPhoto = File(photo.path);
//                             });
//                             _videoController = VideoPlayerController.asset(
//                                 'assets/videos/compartment_scan.mp4'
//                               )..initialize().then((_) {
//                                 setState(() {});
//                                 _videoController!.play();
//                                 _videoController!.setLooping(true);
//                               });
//                           }
//                         },
//                         icon: const Icon(Icons.camera_alt),
//                         label: const Text('Take Photo'),
//                       ),
                    
//                     if (compartmentPhoto != null)
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(12),
//                         child: Image.file(
//                           compartmentPhoto!,
//                           height: 200, // Slightly bigger height
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
                    
//                     const SizedBox(height: 10),

//                     if (_videoController != null && _videoController!.value.isInitialized)
//                       Column(
//                         children: [
//                           Container(
//                             height: 200, // Slightly bigger height
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: AspectRatio(
//                                 aspectRatio: _videoController!.value.aspectRatio,
//                                 child: VideoPlayer(_videoController!),
//                               ),
//                           ),
//                           const SizedBox(height: 20),
//                           // ADDED: AI Summary section
//                           Container(
//                             padding: const EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: Colors.green.shade50,
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(color: Colors.green.shade200),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       _currentLanguage == 'ta' ? 'பகுப்பாய்வு சுருக்கம்' : 'Analysis Summary',
//                                       style: const TextStyle(fontWeight: FontWeight.bold),
//                                     ),
//                                     Row(
//                                       children: [
//                                         // Language Toggle
//                                         IconButton(
//                                           icon: const Icon(Icons.language, size: 20),
//                                           onPressed: () {
//                                             setState(() {
//                                               _currentLanguage = _currentLanguage == 'en' ? 'ta' : 'en';
//                                               _initializeTts();
//                                             });
//                                           },
//                                         ),
//                                         // Read Aloud Button
//                                         IconButton(
//                                           icon: Icon(_isSpeaking ? Icons.stop : Icons.volume_up, size: 20),
//                                           onPressed: () {
//                                             _speakSummary(_currentLanguage == 'ta' ? _summaryTextTamil : _summaryText);
//                                           },
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   _currentLanguage == 'ta' ? _summaryTextTamil : _summaryText,
//                                   style: const TextStyle(fontSize: 14),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       )
//                     else if (compartmentPhoto != null)
//                       const CircularProgressIndicator(),
//                   ],
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     _videoController?.dispose();
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Cancel'),
//                 ),
//                 ElevatedButton(
//                   onPressed: compartmentPhoto != null && _videoController != null
//                     ? () {
//                       final newCompartment = Compartment(
//                         animalType: typeController.text,
//                         maleCount: int.tryParse(maleCountController.text) ?? 0,
//                         femaleCount: int.tryParse(femaleCountController.text) ?? 0,
//                         note: noteController.text,
//                         icon: Icons.pets,
//                         color: Colors.blue,
//                       );
//                       setState(() {
//                         _compartments.add(newCompartment);
//                       });
//                       _videoController?.dispose();
//                       Navigator.pop(context);
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('New compartment added successfully!')),
//                       );
//                     }
//                     : null,
//                   child: const Text('Add'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     ).then((_) {
//       _videoController?.dispose();
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
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddCompartmentDialog,
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


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'video_playback_page.dart'; // Import the new video page

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
            const Icon(Icons.check_circle_outline, color: Colors.green, size: 80),
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
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
  final ImagePicker _picker = ImagePicker();

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

  void _showAddCompartmentDialog() {
    final TextEditingController typeController = TextEditingController();
    final TextEditingController maleCountController = TextEditingController();
    final TextEditingController femaleCountController = TextEditingController();
    final TextEditingController noteController = TextEditingController();
    
    File? compartmentPhoto;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
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
                    const SizedBox(height: 20),

                    if (compartmentPhoto == null)
                      ElevatedButton.icon(
                        onPressed: () async {
                          final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                          if (photo != null) {
                            setState(() {
                              compartmentPhoto = File(photo.path);
                            });
                          }
                        },
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Take Photo'),
                      ),
                    
                    if (compartmentPhoto != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          compartmentPhoto!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    
                    const SizedBox(height: 10),

                    // ADDED: AI Summary section
                    if (compartmentPhoto != null)
Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                // ADDED: Button to view the video analysis
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const VideoPlaybackPage(
                                          videoPath: 'assets/videos/compartment_scan.mp4',
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.play_circle_outline),
                                  label: const Text('View Video Analysis'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    minimumSize: const Size.fromHeight(40),
                                  ),
                                ),
                              ],
                            ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: compartmentPhoto != null
                    ? () {
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
                    }
                    : null,
                  child: const Text('Add'),
                ),
              ],
            );
          },
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
        // ignore: deprecated_member_use
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCompartmentDialog,
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