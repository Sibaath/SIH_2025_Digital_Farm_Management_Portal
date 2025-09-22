import 'package:flutter/material.dart';
import 'contacts_page.dart';
import 'package:frontend/l10n/app_localizations.dart';

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
  String _dummyPdfPath = 'assets/docs/medical_report.pdf';

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
    final loc = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(loc.medicalReportAttached)),
    );
  }

  void _bookAppointment() {
    final newAppointment = Appointment(
      doctor: widget.doctor,
      date: _selectedDate,
      time: _selectedTime,
    );
    widget.onAppointmentBooked(newAppointment);

    final loc = AppLocalizations.of(context)!;
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(loc.appointmentBooked)), // Use the correct getter from AppLocalizations
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text('${loc.bookAppointmentWith} ${widget.doctor.name}'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Doctor Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/doctor.jpeg'),
                      backgroundColor: Colors.green.shade100,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.doctor.name,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.doctor.specialization,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
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
            ),
            const SizedBox(height: 20),

            // Date & Time Selection
            Text(loc.selectDateTime, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            _buildDateTimeSelection(loc),
            const SizedBox(height: 20),

            // Medical Documents
            Text(loc.medicalDocuments, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ListTile(
              leading: Icon(Icons.attach_file, color: _isReportAttached ? Colors.green : Colors.grey),
              title: Text(loc.attachMedicalReport),
              trailing: _isReportAttached ? const Icon(Icons.check_circle, color: Colors.green) : null,
              onTap: _attachReport,
              tileColor: _isReportAttached ? Colors.green.shade50 : null,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(loc.animalHealthSummary),
                    content: Text(loc.animalHealthSummaryContent),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(loc.close),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.description),
              label: Text(loc.viewAnimalHealthSummary),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),

            // Book Appointment Button
            ElevatedButton(
              onPressed: _isReportAttached ? _bookAppointment : null,
              child: Text(loc.bookAppointment),
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

  Widget _buildDateTimeSelection(AppLocalizations loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _selectDate(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.green),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Select Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    style: const TextStyle(color: Colors.green),
                  ),
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
