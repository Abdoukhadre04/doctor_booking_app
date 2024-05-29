import 'package:flutter/material.dart';

enum DoctorCategory {
  anesthesiology (
    name: 'Anesthesiology',
    icon: Icons.account_circle_outlined,
  ),
  cardiology (
    name: 'Cardiology',
    icon: Icons.favorite_border_outlined,
  ),
  dentist (
    name: 'Dentist',
    icon: Icons.person_2_outlined,
  ),
  neurology (
    name: 'Neurology',
    icon: Icons.psychology_outlined,
  ),
  dermatology (
    name: 'Dermatology',
    icon: Icons.health_and_safety_outlined,
  ),
  pulmonology (
    name: 'Pulmonology',
    icon: Icons.medical_services_outlined,
  ),
  emergencyMedicine (
    name: 'Emergency Medicine',
    icon: Icons.local_pharmacy_outlined,
  );
  final String name;
  final IconData icon;

  const DoctorCategory(
    {
      required this.name,
      required this.icon,
    }
  );
}