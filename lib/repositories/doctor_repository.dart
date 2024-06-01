import 'package:models/models.dart';

class DoctorRepository {
  const DoctorRepository();

  Future<List<DoctorCategory>> fetchDoctorCategories() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return DoctorCategory.values;
  }
  Future<List<Doctor>> fetchDoctor() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return Doctor.sampleDoctors;
  }
  Future<List<Doctor>> fetchDoctorByCategories(String categoryId) async {
    throw UnimplementedError();
  }
  Future<Doctor?> fetchDoctorById( String doctorId) async {
    throw UnimplementedError();
  }
}
