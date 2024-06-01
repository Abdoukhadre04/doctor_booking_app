import 'package:models/src/consultation_mode.dart';

class DoctorPackage {
  final String id;
  final String doctorId;
  final String packageName;
  final String description;
  final Duration duration;
  final double price;
  final ConsultationMode consultationMode;

  const DoctorPackage({
    required this.id,
    required this.doctorId,
    required this.packageName,
    required this.description,
    required this.duration,
    required this.price,
    required this.consultationMode, 
  });

  static const samplePackages = [
    DoctorPackage(
      id: '1',
      doctorId: '1',
      packageName: 'Basic',
      description: 'Basic consultation package',
      duration: Duration(minutes: 10),
      price: 100.0,
      consultationMode: ConsultationMode.video,
    ),
    DoctorPackage(
      id: '2',
      doctorId: '1',
      packageName: 'Standard',
      description: 'Standard consultation package',
      duration: Duration(minutes: 60),
      price: 250.0,
      consultationMode: ConsultationMode.video,
    ),
    DoctorPackage(
      id: '3',
      doctorId: '1',
      packageName: 'Premium',
      description: 'Basic consultation package',
      duration: Duration(minutes: 90),
      price: 500.0,
      consultationMode: ConsultationMode.inPerson,
    ),
  ];
}
