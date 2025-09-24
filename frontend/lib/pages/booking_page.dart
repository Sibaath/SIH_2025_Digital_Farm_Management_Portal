import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contacts_page.dart'; // Import contacts_page to use the shared Doctor class.

class BookingPage extends StatefulWidget {
  final Doctor doctor;
  final Function(Appointment) onAppointmentBooked;

  const BookingPage({super.key, required this.doctor, required this.onAppointmentBooked});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime _selectedDate = DateTime.now();
  String _selectedTime = '10:00 AM';
  bool _isReportAttached = false;
  // String _dummyPdfPath = 'assets/docs/medical_report.pdf'; // Placeholder path

  final List<String> _availableTimes = const [
    '10:00 AM',
    '11:00 AM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _attachReport() {
    setState(() {
      _isReportAttached = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Medical report attached!')),
    );
  }

  void _bookAppointment() {
    final newAppointment = Appointment(
      doctor: widget.doctor,
      date: _selectedDate,
      time: _selectedTime,
    );
    widget.onAppointmentBooked(newAppointment);

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Appointment booked successfully!')),
    );
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment with ${widget.doctor.name}'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: const AssetImage('assets/images/doctor.jpeg'),
                          backgroundColor: Colors.green.shade100,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.doctor.name,
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(widget.doctor.specialization, style: TextStyle(color: Colors.grey.shade600)),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
                                  const SizedBox(width: 4),
                                  Text('${widget.doctor.rating}'),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.location_on, color: Colors.red, size: 16),
                                  const SizedBox(width: 4),
                                  Text(widget.doctor.location),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // ADDED: Call button
                        IconButton(
                          icon: const Icon(Icons.phone, color: Colors.green, size: 28),
                          onPressed: () => _makePhoneCall(widget.doctor.phoneNumber),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Date and Time Selection
            const Text('Select Date & Time', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            _buildDateTimeSelection(),
            const SizedBox(height: 20),

            // Document and Summary Attachment
            const Text('Medical Documents', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ListTile(
              leading: Icon(Icons.attach_file, color: _isReportAttached ? Colors.green : Colors.grey),
              title: const Text('Attach Medical Report (PDF)'),
              trailing: _isReportAttached ? const Icon(Icons.check_circle, color: Colors.green) : null,
              onTap: _attachReport,
              tileColor: _isReportAttached ? Colors.green.shade50 : null,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Dummy functionality to show the health summary
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Animal Health Summary'),
                    content: const Text('Summary of the animal health based on recent scans will appear here.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.description),
              label: const Text('View Animal Health Summary'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),

            // Book Appointment Button
            ElevatedButton(
              onPressed: _isReportAttached ? _bookAppointment : null,
              child: const Text('Book Appointment'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _selectDate(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: _selectedTime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
                icon: const Icon(Icons.access_time, color: Colors.green),
                items: _availableTimes.map((String time) {
                  return DropdownMenuItem<String>(
                    value: time,
                    child: Text(time),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTime = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}