import 'package:flutter/material.dart';
import 'booking_page.dart';
import 'package:frontend/l10n/app_localizations.dart';
import '../widgets/language_dropdown.dart';

class Doctor {
  final String name;
  final String specialization;
  final String location;
  final double rating;

  Doctor({
    required this.name,
    required this.specialization,
    required this.location,
    required this.rating,
  });

  String get imageUrl => "assets/images/doctor.jpeg";
}

class Appointment {
  final Doctor doctor;
  final DateTime date;
  final String time;

  Appointment({
    required this.doctor,
    required this.date,
    required this.time,
  });
}

class ContactsPage extends StatefulWidget {
  final Function(Locale) onLanguageChanged;

  const ContactsPage({super.key, required this.onLanguageChanged});

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late List<Doctor> _availableDoctors;
  final List<Appointment> _bookedAppointments = [];

  void _addAppointment(Appointment newAppointment) {
    setState(() {
      _bookedAppointments.add(newAppointment);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final loc = AppLocalizations.of(context)!;

    // Initialize doctors with localized names and specializations
    _availableDoctors = [
      Doctor(
        name: loc.doctorJohnDoe,
        specialization: loc.avianExpert,
        location: loc.madurai,
        rating: 4.8,
      ),
      Doctor(
        name: loc.doctorJaneSmith,
        specialization: loc.swineSpecialist,
        location: loc.coimbatore,
        rating: 4.9,
      ),
      Doctor(
        name: loc.doctorEmilyWhite,
        specialization: loc.generalVeterinary,
        location: loc.trichy,
        rating: 4.5,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.veterinariansNearby),
        backgroundColor: Colors.green,
        actions: [
          LanguageDropdown(
            currentLocale: Localizations.localeOf(context),
            onLanguageChanged: widget.onLanguageChanged,
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          _buildSectionHeader(loc.veterinariansNearby),
          _buildDoctorList(),
          if (_bookedAppointments.isNotEmpty) _buildSectionHeader(loc.bookedAppointments),
          if (_bookedAppointments.isNotEmpty) _buildAppointmentList(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildDoctorList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final doctor = _availableDoctors[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: _buildDoctorCard(doctor),
          );
        },
        childCount: _availableDoctors.length,
      ),
    );
  }

  Widget _buildDoctorCard(Doctor doctor) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingPage(
              doctor: doctor,
              onAppointmentBooked: _addAppointment,
            ),
          ),
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: const AssetImage('assets/images/doctor.jpeg'),
                backgroundColor: Colors.green.shade100,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doctor.specialization,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${doctor.rating}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.location_on, color: Colors.red, size: 16),
                        const SizedBox(width: 4),
                        Text(doctor.location),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.green, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final appointment = _bookedAppointments[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: _buildAppointmentCard(appointment),
          );
        },
        childCount: _bookedAppointments.length,
      ),
    );
  }

  Widget _buildAppointmentCard(Appointment appointment) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appointment.doctor.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 4),
            Text(appointment.doctor.specialization, style: const TextStyle(color: Colors.black87)),
            const Divider(color: Colors.green),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 8),
                Text(
                  '${appointment.date.day}/${appointment.date.month}/${appointment.date.year}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 8),
                Text(appointment.time, style: const TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
