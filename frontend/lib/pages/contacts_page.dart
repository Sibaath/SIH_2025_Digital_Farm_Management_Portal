import 'package:flutter/material.dart';
import 'booking_page.dart';

// The imageUrl property has been removed from the Doctor class
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

  String get imageUrl => "assets/images/doctor.jpeg"; // Placeholder image path
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
  const ContactsPage({super.key});

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  // Dummy data updated to reflect the change in the Doctor class
  final List<Doctor> _availableDoctors = [
    Doctor(
      name: 'Dr. John Doe',
      specialization: 'Avian Biosecurity Expert',
      location: 'Madurai',
      rating: 4.8,
    ),
    Doctor(
      name: 'Dr. Jane Smith',
      specialization: 'Swine Health Specialist',
      location: 'Coimbatore',
      rating: 4.9,
    ),
    Doctor(
      name: 'Dr. Emily White',
      specialization: 'General Veterinary Care',
      location: 'Trichy',
      rating: 4.5,
    ),
  ];

  final List<Appointment> _bookedAppointments = [];

  void _addAppointment(Appointment newAppointment) {
    setState(() {
      _bookedAppointments.add(newAppointment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSectionHeader(context, "Veterinarians Nearby"),
        _buildDoctorList(),
        if (_bookedAppointments.isNotEmpty)
          _buildSectionHeader(context, "Booked Appointments"),
        if (_bookedAppointments.isNotEmpty)
          _buildAppointmentList(),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
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
        (BuildContext context, int index) {
          final doctor = _availableDoctors[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: _buildDoctorCard(context, doctor),
          );
        },
        childCount: _availableDoctors.length,
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context, Doctor doctor) {
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
                // Use a local asset for the profile image
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
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${doctor.rating}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.location_on, color: Colors.red, size: 16),
                        const SizedBox(width: 4),
                        Text(doctor.location),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.green, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
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
            Text(appointment.doctor.specialization, style: TextStyle(color: Colors.black87)),
            const Divider(color: Colors.green),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 8),
                Text(
                  '${appointment.date.day}/${appointment.date.month}/${appointment.date.year}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
                Icon(Icons.access_time, size: 16),
                const SizedBox(width: 8),
                Text(appointment.time, style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}