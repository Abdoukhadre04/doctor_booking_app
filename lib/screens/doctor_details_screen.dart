import 'package:doctor_booking/shared/widgets/buttons/app_icon_button.dart';
import 'package:doctor_booking/shared/widgets/cards/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctorId});

  final String doctorId;

  @override
  Widget build(BuildContext context) {
    // create the bloc here
    return const DoctorDetailsSView();
  }
}

class DoctorDetailsSView extends StatelessWidget {
  const DoctorDetailsSView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // create UI
    return Scaffold(
      appBar: AppBar(
        leading: AppIconButton(
          icon: Icons.arrow_back,
          onTap: () => Navigator.pop(context),
        ),
        title: Center(
          child: Text(
            'Doctor Details',
            style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          AppIconButton(
            icon: Icons.favorite_outline,
            onTap: (){

            }
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorCard(doctor:  Doctor.sampleDoctors[0])
          ],
        ),
      ),
    );
  }
}
