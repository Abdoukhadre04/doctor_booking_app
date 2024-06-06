import 'package:doctor_booking/repositories/doctor_repository.dart';
import 'package:doctor_booking/screens/home_screen.dart';
import 'package:doctor_booking/shared/theme/app_theme.dart';
import 'package:doctor_booking/state/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final doctorRepository = DoctorRepository();
  runApp(MyApp(doctorRepository: doctorRepository));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.doctorRepository});

  final DoctorRepository doctorRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: doctorRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => 
              HomeBloc(doctorRepository: doctorRepository)
                ..add(LoadHomeEvent())
              // SubjectBloc(subjectRepository: subjectRepository)
          ),
          // BlocProvider(
          //   create: (context) => SubjectBloc(),
          // ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Doctor Booking',
          theme: const AppTheme().themeData,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
