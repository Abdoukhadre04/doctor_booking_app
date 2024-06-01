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
  //https://media.istockphoto.com/id/1389245890/photo/portrait-of-young-asian-male-doctor-on-blue-background.jpg?s=2048x2048&w=is&k=20&c=M8tJ0cjO4WV8KiVkuHGalnwczEYM4Fxj7oeNqdfBR4U=
  static final sampleDoctors = [
    Doctor(
      id: '1', 
      name: 'Dr. Oumou Kh. Diallo', 
      bio: 'Dr. John Doe is a cardiologist in New York', 
      profileImageUrl: 'https://images.pexels.com/photos/3714743/pexels-photo-3714743.jpeg?auto=compress&cs=tinysrgb&w=600', 
      category: DoctorCategory.cardiology, 
      address: DoctorAddress.sampleAddresses[0], 
      packages: DoctorPackage.samplePackages, 
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.5,
      reviewCount: 100,
      patientCount: 1000,
    ),
    Doctor(
      id: '2', 
      name: 'Dr. John DOE', 
      bio: 'Dr. John Doe is a cardiologist in New York', 
      profileImageUrl: 'https://media.istockphoto.com/id/1389245890/photo/portrait-of-young-asian-male-doctor-on-blue-background.jpg?s=2048x2048&w=is&k=20&c=M8tJ0cjO4WV8KiVkuHGalnwczEYM4Fxj7oeNqdfBR4U=', 
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
