import 'package:equatable/equatable.dart';
import 'package:models/src/doctor_address.dart';
import 'package:models/src/doctor_category.dart';
import 'package:models/src/doctor_package.dart';
import 'package:models/src/doctor_working_hours.dart';

class Doctor extends Equatable {
  final String id;
  final String name;
  final String bio;
  final String profileImageUrl;
  final DoctorCategory category;
  final DoctorAddress address;
  final List<DoctorPackage> packages;
  final List<DoctorWorkingHours> workingHours;
  final double rating;
  final int reviewCount;
  final int patientCount;

  const Doctor(
    {
      required this.id,
      required this.name,
      required this.bio,
      required this.profileImageUrl,
      required this.category,
      required this.address,
      required this.packages,
      required this.workingHours,
      this.rating = 0.0,
      this.reviewCount = 0,
      this.patientCount = 0,
    }
  );
  
  @override
  List<Object?> get props => [
    id,
    name,
    bio,
    profileImageUrl,
    category,
    address,
    packages,
    workingHours,
    rating,
    reviewCount,
    patientCount
  ];

  static final sampleDoctor = [
    Doctor(
      id: '1', 
      name: 'Dr. John DOE', 
      bio: 'Dr. John Doe is a cardiologist in New York', 
      profileImageUrl: 'https://images.unplash.com/photo-1557683316-973673baf926', 
      category: DoctorCategory.cardiology, 
      address: DoctorAddress.sampleAddresses[0], 
      packages: DoctorPackage.samplePackages, 
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
      reviewCount: 100,
      patientCount: 1000,
    ),
  ];
}
